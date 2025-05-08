#include <stdio.h>

void test5() {
    char buffer[3] = {'A', 'B', 'C'};
    for (int i = 0; i <= 3; i++) {  // accesses buffer[3] which is OOB
        printf("buffer[%d] = %c\n", i, buffer[i]);  // CWE-119
    }
}
