#include <stdio.h>
#include <string.h>

void boo(char *input) {
    char init[65];
    char buffer[64]; // Buffer overflow vulnerability
    buffer[0]=init;
    strcpy(buffer, init);
    printf("Buffer content: %s\n", buffer);
}

int main() {
    char large_input[128];
    memset(large_input, 'A', 127);
    large_input[127] = '\0';
    boo(large_input);
    return 0;
}