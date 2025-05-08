#include <stdio.h>
#include <string.h>

void boo(char *input) {
    char buffer[64];
    strncpy(buffer, input, sizeof(buffer) - 1);
    buffer[sizeof(buffer) - 1] = '\0';  
    printf("Buffer content: %s\n", buffer);
}

int main() {
    char large_input[128];
    memset(large_input, 'A', 127);
    large_input[127] = '\0';
    boo(large_input);
    return 0;
}