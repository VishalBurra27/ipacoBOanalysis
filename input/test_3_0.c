#include <stdio.h>
#include <string.h>

void test4() {
    char buffer[5];
    for (int i = 0; i <= 5; i++) {  // 5 goes out.
        buffer[i] = 'A';            // CWE-119
    }
    buffer[4] = '\0';
    printf("Test4: %s\n", buffer);
}
