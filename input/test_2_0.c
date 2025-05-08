#include <stdio.h>
#include <string.h>
#include <ctype.h>

void foo() {
    char buffer[10]; // Small buffer
    char temp[20] = "Hello";
    int length = 0;
    int i;

    // Fill buffer with placeholder content
    strcpy(buffer, "init"); // Safe since "init" fits in 10 bytes

    // Add some characters manually
    buffer[4] = '_';
    buffer[5] = 'x';
    buffer[6] = '\0';

    printf("Buffer before input: %s\n", buffer);

    // Copy buffer to another temporary string
    char copied[10];
    strncpy(copied, temp, sizeof(copied));
    copied[sizeof(copied) - 1] = '\0'; // Null-terminate

    // Print each character in copied string
    for (i = 0; copied[i] != '\0'; i++) {
        printf("copied[%d] = %c\n", i, copied[i]);
        length++;
    }

    printf("Length so far: %d\n", length);

    //UNSAFE INPUT — BUFFER OVERFLOW RISK
    printf("Enter some text: ");
    gets(buffer); // Danger: No bounds checking!

    printf("You entered: %s\n", buffer);
}

int main() {
    foo();
    return 0;
}
