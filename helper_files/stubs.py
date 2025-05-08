import re
import os
import argparse
import logging

# Setup basic logging
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')

# Regex patterns
# This code defines and compiles several regular expression patterns to match C/C++ variable declarations, function calls, single-line and multi-line comments, and struct type definitions.
VAR_DECL_REGEX_SIMPLE_V2 = re.compile(
    r"^\s*([a-zA-Z_][\w\s\*<>.:&]*?(?<!\w))\s+([a-zA-Z_]\w*)(\s*\[[^\]]*\])?\s*(?:=.*?)?;"
)
VAR_DECL_REGEX_SIMPLE = re.compile(
    r"^\s*(static\s+|extern\s+|const\s+|volatile\s+)*"
    r"((?:struct|enum|class)\s+[a-zA-Z_]\w*\s*[\*&]*|"
    r"[a-zA-Z_]\w*(?:\s*::\s*[a-zA-Z_]\w*)*\s*[\*&]*)"
    r"\s+([a-zA-Z_]\w*)"
    r"(\s*\[[^\]]*\])?\s*"
    r"(?:=.*)?;"
)
FUNC_CALL_REGEX = re.compile(
    r"^\s*(?:([a-zA-Z_]\w*)\s*=\s*)?"
    r"(?:\(\s*([a-zA-Z_][\w\s\*<>.:&]+)\s*\)\s*)?"
    r"([a-zA-Z_]\w*(?:::[a-zA-Z_]\w*)*)\s*"
    r"\((.*?)\)\s*;"
)
SINGLE_LINE_COMMENT_REGEX = re.compile(r"//.*")
MULTI_LINE_COMMENT_REGEX = re.compile(r"/\*.*?\*/", re.DOTALL)
STRUCT_TYPE_REGEX = re.compile(r"\bstruct\s+([a-zA-Z_]\w*)") 


#Then,we use this code to define utility functions that remove comments from code, normalize type strings, extract struct names from type definitions, and split function argument strings while correctly handling nested parentheses, angle brackets, and quoted strings.
def strip_comments(code):
    code = SINGLE_LINE_COMMENT_REGEX.sub("", code)
    code = MULTI_LINE_COMMENT_REGEX.sub("", code)
    return code

def clean_type(type_str):
    if not type_str: return ""
    return ' '.join(type_str.strip().split())

def extract_struct_names_from_type(type_str, struct_names_set):
    if not type_str:
        return
    matches = STRUCT_TYPE_REGEX.findall(type_str)
    for struct_name in matches:
        struct_names_set.add(struct_name)

def split_args(args_str):
    args = []
    if not args_str.strip():
        return []
    
    current_arg = ""
    paren_level = 0
    angle_bracket_level = 0 
    in_string = None

    for char in args_str:
        if in_string:
            current_arg += char
            if char == in_string:
                if not current_arg.endswith(f'\\{in_string}'):
                    in_string = None
        elif char == ',' and paren_level == 0 and angle_bracket_level == 0:
            args.append(current_arg.strip())
            current_arg = ""
        else:
            current_arg += char
            if char == '(': paren_level += 1
            elif char == ')': paren_level -= 1
            elif char == '<': angle_bracket_level +=1
            elif char == '>': angle_bracket_level -=1
            elif char == '"' or char == "'": in_string = char
    
    if current_arg:
        args.append(current_arg.strip())
    return [arg for arg in args if arg]

#Then we use the function to analyze a function argument string, determineing its type and an appropriate parameter name by checking for casts, literals, string constants, variable references, and undefined constants; it also updates relevant sets and counters, ensures parameter name uniqueness, and extracts any struct names used in the type.

def get_arg_details(arg_str, var_types, generated_param_names_for_func, 
                    undefined_constants_set, used_struct_names_set,
                    numeric_param_idx_ref, string_param_idx_ref, generic_param_idx_ref):
    arg_str = arg_str.strip()
    original_arg_for_name = arg_str 

    cast_on_arg_match = re.match(r"\(\s*([a-zA-Z_][\w\s\*<>.:&]+)\s*\)\s*(.*)", arg_str)
    effective_arg_str = arg_str
    if cast_on_arg_match:
        # The cast type itself might contain a struct name
        extract_struct_names_from_type(cast_on_arg_match.group(1), used_struct_names_set)
        effective_arg_str = cast_on_arg_match.group(2).strip()
        original_arg_for_name = effective_arg_str

    param_type = "void*" # Default
    param_name = ""

    if re.fullmatch(r"^(0[xX][0-9a-fA-F]+[ULul]*|[0-9]+[ULul]*)$", effective_arg_str):
        param_type = "int"
        param_name = f"num_param_{numeric_param_idx_ref[0]}"
        numeric_param_idx_ref[0] += 1
    elif re.fullmatch(r"[0-9]*\.[0-9]+[fF]?", effective_arg_str) or \
         re.fullmatch(r"[0-9]+\.[0-9]*[eE][+-]?[0-9]+[fF]?", effective_arg_str) or \
         re.fullmatch(r"\.[0-9]+[eE][+-]?[0-9]+[fF]?", effective_arg_str):
        if 'f' in effective_arg_str.lower() or 'F' in effective_arg_str:
            param_type = "float"
        else:
            param_type = "double"
        param_name = f"fp_param_{numeric_param_idx_ref[0]}"
        numeric_param_idx_ref[0] += 1
    elif re.fullmatch(r'"(?:\\.|[^"\\])*"', effective_arg_str):
        param_type = "const char*"
        param_name = f"str_param_{string_param_idx_ref[0]}"
        string_param_idx_ref[0] += 1
    else:
        base_var_match = re.match(r"([a-zA-Z_]\w*)(?:\.|->|\[)", effective_arg_str)
        lookup_key = base_var_match.group(1) if base_var_match else effective_arg_str
        
        is_addr_of = False
        addr_of_match = re.match(r"&\s*([a-zA-Z_]\w*)", lookup_key)
        if addr_of_match:
            lookup_key = addr_of_match.group(1)
            is_addr_of = True

        if lookup_key in var_types:
            actual_type = var_types[lookup_key]
            param_name = lookup_key
            
            if is_addr_of:
                param_type = f"{clean_type(actual_type)}*"
            elif actual_type.endswith('*'):
                base_type = actual_type[:-1].strip()
                base_type_cleaned_parts = [p for p in base_type.split() if p not in ('const', 'volatile')]
                base_type_final = ' '.join(base_type_cleaned_parts) if base_type_cleaned_parts else base_type
                param_type = f"const {base_type_final}" # Example specific logic
            else:
                param_type = actual_type
        elif re.fullmatch(r"[A-Z_][A-Z0-9_]*", effective_arg_str):
            param_type = "int" # Default type for undefined constants
            param_name = effective_arg_str
            undefined_constants_set.add(effective_arg_str)
        else: # Default for unrecognized arguments
            param_name = f"arg_param_{generic_param_idx_ref[0]}"
            generic_param_idx_ref[0] += 1
            param_type = "void*" # Already default, but explicit

    # Ensure unique parameter name for this function
    final_param_name = param_name
    count = 1
    while final_param_name in generated_param_names_for_func:
        final_param_name = f"{param_name}_{count}"
        count += 1
    
    extract_struct_names_from_type(param_type, used_struct_names_set)
    return clean_type(param_type), final_param_name


def main():
    parser = argparse.ArgumentParser(description="Generate C++ stubs for functions, constants, and structs.")
    parser.add_argument("cpp_file_path", help="Path to the input C++ file.")
    args = parser.parse_args()

    cpp_filepath = args.cpp_file_path
    if not os.path.isfile(cpp_filepath):
        logging.error(f"File not found: {cpp_filepath}")
        return

    try:
        with open(cpp_filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        logging.error(f"Error reading file {cpp_filepath}: {e}")
        return

    content_no_comments = strip_comments(content)
    lines = content_no_comments.splitlines()

    variable_types = {}
    function_stubs = {} 
    undefined_constants = set()
    used_struct_names = set() # To store names of structs used in types

    logging.info("--- Pass 1: Identifying variable declarations ---")
    for line_num, line in enumerate(lines):
        line = line.strip()
        match = VAR_DECL_REGEX_SIMPLE_V2.match(line)
        if not match:
             match = VAR_DECL_REGEX_SIMPLE.match(line)

        if match:
            groups = match.groups()
            full_type = ""
            var_name = ""
            array_spec = None

            if len(groups) == 5 and groups[0] is not None : # VAR_DECL_REGEX_SIMPLE
                qualifiers = groups[0] if groups[0] else ""
                type_core = groups[1] if groups[1] else ""
                ptr_space = groups[2] if groups[2] else " "
                var_name = groups[3]
                array_spec = groups[4]
                full_type = clean_type(f"{qualifiers} {type_core} {ptr_space}".strip())
            elif len(groups) == 3: # VAR_DECL_REGEX_SIMPLE_V2
                full_type = clean_type(groups[0])
                var_name = groups[1]
                array_spec = groups[2]
            else:
                logging.warning(f"Line {line_num+1}: Regex matched but group structure unexpected: {line}")
                continue
            
            if array_spec:
                 if not full_type.endswith('*'):
                     full_type = f"{full_type}*"
            
            full_type = clean_type(full_type.replace(" *", "*").replace(" &", "&"))

            if var_name in variable_types:
                logging.warning(f"Line {line_num+1}: Variable '{var_name}' redefined. Using first: '{variable_types[var_name]}'. New: '{full_type}'")
            else:
                variable_types[var_name] = full_type
                logging.info(f"  Declared: {var_name} -> {full_type}")
                extract_struct_names_from_type(full_type, used_struct_names) # Extract structs from var type
    
    logging.info(f"Identified variable types: {variable_types}")
    logging.info(f"Tentatively identified struct types for stubbing: {used_struct_names}")


    logging.info("--- Pass 2: Identifying function calls ---")
    numeric_param_idx_ref = [1] 
    string_param_idx_ref = [1]
    generic_param_idx_ref = [1]

    for line_num, line in enumerate(lines):
        line = line.strip()
        match = FUNC_CALL_REGEX.match(line)
        if match:
            assigned_var, cast_type_str, func_name, args_str = match.groups()
            logging.info(f"  Found call: {func_name}({args_str}) on line {line_num+1}")

            return_type = "void"
            if cast_type_str:
                return_type = clean_type(cast_type_str)
                extract_struct_names_from_type(return_type, used_struct_names) # Extract from cast
            elif assigned_var and assigned_var in variable_types:
                return_type = variable_types[assigned_var]
                extract_struct_names_from_type(return_type, used_struct_names) # Extract from var type
            elif assigned_var:
                return_type = "void*"
                logging.warning(f"    Return type for {func_name} from undeclared var '{assigned_var}', using 'void*'.")

            raw_args = split_args(args_str)
            param_details = []
            generated_param_names_for_this_func = set()

            for arg_val_str in raw_args:
                param_type, param_name = get_arg_details(
                    arg_val_str, variable_types, generated_param_names_for_this_func,
                    undefined_constants, used_struct_names, # Pass used_struct_names here
                    numeric_param_idx_ref, string_param_idx_ref, generic_param_idx_ref
                )
                param_details.append((param_type, param_name))
                generated_param_names_for_this_func.add(param_name)
                # extract_struct_names_from_type called inside get_arg_details for param_type

            params_str = ", ".join([f"{pt} {pn}" for pt, pn in param_details]) if param_details else "void"
            
            arg_types_mangled = "_".join(pt.replace(" ", "_").replace("*", "ptr").replace("&", "ref") for pt, _ in param_details)
            func_signature_key = f"{func_name}({arg_types_mangled})"

            if func_signature_key not in function_stubs:
                stub = f"{return_type} {func_name}({params_str});"
                function_stubs[func_signature_key] = stub
                logging.info(f"    Generated stub: {stub}")

    output_dir = os.path.dirname(os.path.abspath(cpp_filepath))
    patch_file_path = os.path.join(output_dir, "template_patch.h")

    logging.info(f"--- Writing to {patch_file_path} ---")
    with open(patch_file_path, 'w', encoding='utf-8') as f:
        f.write("/* Automatically generated stubs and definitions */\n\n")
        
        if used_struct_names:
            f.write("/* Basic struct definitions (placeholders) */\n")
            for s_name in sorted(list(used_struct_names)):
                f.write(f"struct {s_name} {{\n")
                f.write(f"    // TODO: Define actual members for struct {s_name}\n")
                f.write(f"    int _placeholder_member_;\n")
                f.write(f"}};\n")
                # Optional: common C practice to typedef after struct definition
                # f.write(f"typedef struct {s_name} {s_name};\n") 
            f.write("\n")

        if undefined_constants:
            f.write("/* Potentially undefined constants */\n")
            for const_name in sorted(list(undefined_constants)):
                f.write(f"#define {const_name} 0 // TODO: Define actual value for {const_name}\n")
            f.write("\n")

        if function_stubs:
            f.write("/* Function stubs */\n")
            for stub_key in sorted(function_stubs.keys()):
                f.write(f"{function_stubs[stub_key]}\n")
        f.write("\n/* End of auto-generated content */\n")

    logging.info("Final list of structs for stubbing: %s", sorted(list(used_struct_names)))
    logging.info("Done.")

if __name__ == "__main__":
    main()