import re
import sys

def remove_comments_and_trim(line):
    # Remove inline comments
    line = re.sub(r'//.*', '', line)

    # Remove block comments (naive for single-line blocks)
    line = re.sub(r'/\*.*?\*/', '', line)

    # Strip leading/trailing whitespace
    return line.strip()

def read_and_clean_file(file_path):
    with open(file_path, 'r') as f:
        lines = f.readlines()
    return [remove_comments_and_trim(line) for line in lines]

def compare_files(file1, file2):
    lines1 = read_and_clean_file(file1)
    lines2 = read_and_clean_file(file2)

    max_len = max(len(lines1), len(lines2))
    vulnerable_lines = []

    for i in range(max_len):
        line1 = lines1[i] if i < len(lines1) else ''
        line2 = lines2[i] if i < len(lines2) else ''
        if line1 != line2:
            vulnerable_lines.append(i + 1)  # 1-based index

    return vulnerable_lines

if len(sys.argv) != 3:
    print("Usage: python file_comparator.py <file1.cpp> <file2.cpp>")
    sys.exit(1)

file1, file2 = sys.argv[1], sys.argv[2]
diff_lines = compare_files(file1, file2)

with open("vulnerable_lines.txt", "w") as out:
    for line_no in diff_lines:
        out.write(f"{line_no}\n")

print(f"Differences written to vulnerable_lines.txt ({len(diff_lines)} lines differ)")
