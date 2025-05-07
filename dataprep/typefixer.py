import re
import sys
import os

def extract_function_signature(full_func_content):
    # Match the first function definition with a body
    pattern = r'([a-zA-Z_][a-zA-Z0-9_ \t\*]*?)\b([a-zA-Z_][a-zA-Z0-9_]*)\s*\((.*?)\)\s*\{'
    match = re.search(pattern, full_func_content, re.DOTALL)
    if match:
        return_type = match.group(1).strip()
        func_name = match.group(2).strip()
        return return_type, func_name
    return None, None

def update_patch_file(patch_content, func_name, return_type):
    # Replace only the first occurrence of the function name with return type
    pattern = rf'(?<!\w)({func_name}\s*\()'
    replacement = f'{return_type} \\1'
    return re.sub(pattern, replacement, patch_content, count=1)

def main(full_func_path, patch_path):
    if not os.path.exists(full_func_path) or not os.path.exists(patch_path):
        print("Error: One or both file paths do not exist.")
        sys.exit(1)

    with open(full_func_path, 'r') as f:
        full_func_content = f.read()

    return_type, func_name = extract_function_signature(full_func_content)

    if not return_type or not func_name:
        print("Error: Could not extract function name and return type.")
        sys.exit(1)

    with open(patch_path, 'r') as f:
        patch_content = f.read()

    updated_patch = update_patch_file(patch_content, func_name, return_type)

    with open(patch_path, 'w') as f:
        f.write(updated_patch)

    print(f"Updated '{patch_path}' with return type '{return_type}' for function '{func_name}'.")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python fix_return_type.py <full_function.cpp> <patch_detail.cpp>")
        sys.exit(1)

    full_function_cpp_path = sys.argv[1]
    patch_detail_cpp_path = sys.argv[2]

    main(full_function_cpp_path, patch_detail_cpp_path)
