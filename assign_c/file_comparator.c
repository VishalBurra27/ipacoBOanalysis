#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>

#define MAX_LINE_LENGTH 1024

// Function to remove comments and trim whitespace from a line
void clean_line(char *line) {
    bool in_block_comment = false;
    char *p = line;
    char *output = line;
    bool in_string = false;

    while (*p != '\0') {
        if (!in_block_comment && !in_string) {
            if (*p == '/' && *(p+1) == '*') {
                in_block_comment = true;
                p += 2;
                continue;
            } else if (*p == '/' && *(p+1) == '/') {
                *output = '\0';
                break;
            } else if (*p == '"') {
                in_string = true;
            }
        } else if (in_block_comment) {
            if (*p == '*' && *(p+1) == '/') {
                in_block_comment = false;
                p += 2;
                continue;
            }
        } else if (in_string) {
            if (*p == '"' && *(p-1) != '\\') {
                in_string = false;
            }
        }

        if (!in_block_comment) {
            *output++ = *p;
        }
        p++;
    }
    *output = '\0';

    // Trim trailing whitespace
    int len = strlen(line);
    while (len > 0 && isspace(line[len - 1])) {
        line[--len] = '\0';
    }
}

// Reads a file into an array of lines (preserves original line numbers)
char** read_lines(const char *filename, int *line_count) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    char **lines = NULL;
    char buffer[MAX_LINE_LENGTH];
    int capacity = 10;
    *line_count = 0;

    lines = malloc(capacity * sizeof(char *));
    if (!lines) {
        perror("Memory allocation failed");
        exit(EXIT_FAILURE);
    }

    while (fgets(buffer, MAX_LINE_LENGTH, file)) {
        if (*line_count >= capacity) {
            capacity *= 2;
            char **new_lines = realloc(lines, capacity * sizeof(char *));
            if (!new_lines) {
                perror("Memory reallocation failed");
                exit(EXIT_FAILURE);
            }
            lines = new_lines;
        }

        // Clean the line but keep it even if empty
        clean_line(buffer);
        lines[*line_count] = strdup(buffer);
        if (!lines[*line_count]) {
            perror("strdup failed");
            exit(EXIT_FAILURE);
        }
        (*line_count)++;
    }

    fclose(file);
    return lines;
}

void compare_files(const char *file1, const char *file2) {
    FILE *output_file = fopen("../vulnerable_lines.txt", "w");
    if (!output_file) {
        perror("Error opening output file");
        exit(EXIT_FAILURE);
    }

    int orig_count, mod_count;
    char **orig_lines = read_lines(file1, &orig_count);
    char **mod_lines = read_lines(file2, &mod_count);

    int i = 0, j = 0;
    while (i < orig_count || j < mod_count) {
        if (i < orig_count && j < mod_count && strcmp(orig_lines[i], mod_lines[j]) == 0) {
            i++;
            j++;
        } else {
            // Find the next matching line in both files
            int next_i = orig_count;
            int next_j = mod_count;
            bool found = false;

            for (int k = i; k < orig_count && !found; k++) {
                for (int l = j; l < mod_count; l++) {
                    if (strcmp(orig_lines[k], mod_lines[l]) == 0) {
                        next_i = k;
                        next_j = l;
                        found = true;
                        break;
                    }
                }
            }

            if (found) {
                // Report all lines from i to next_i-1 in original as changed
                for (int k = i; k < next_i; k++) {
                    fprintf(output_file, "%d\n", k + 1); // 1-based line numbers
                }
                i = next_i;
                j = next_j;
            } else {
                // No more matches, remaining lines are changes
                for (int k = i; k < orig_count; k++) {
                    fprintf(output_file, "%d\n", k + 1);
                }
                break;
            }
        }
    }

    // Free allocated memory
    for (int k = 0; k < orig_count; k++) free(orig_lines[k]);
    free(orig_lines);
    for (int k = 0; k < mod_count; k++) free(mod_lines[k]);
    free(mod_lines);
    fclose(output_file);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <original_file> <modified_file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    compare_files(argv[1], argv[2]);

    return EXIT_SUCCESS;
}