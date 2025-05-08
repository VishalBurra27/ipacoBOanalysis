#include <stdio.h>
#include <string.h>

void boo(char *input) {
    char buffer[64];  // Fixed-size buffer
    strcpy(buffer, input);  // Unsafe copy - no bounds checking!
    printf("Buffer content: %s\n", buffer);
}

int main() {
    char large_input[128];
    memset(large_input, 'A', 127);  // Fill with 'A's (larger than buffer)
    large_input[127] = '\0';  // Null-terminate
    boo(large_input);  // Triggers buffer overflow
    return 0;
}