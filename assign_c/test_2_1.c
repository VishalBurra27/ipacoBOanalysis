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
    strncpy(copied, buffer, sizeof(copied));
    copied[sizeof(copied) - 1] = '\0'; // Null-terminate

    // Print each character in copied string
    for (i = 0; copied[i] != '\0'; i++) {
        printf("copied[%d] = %c\n", i, copied[i]);
        length++;
    }

    printf("Length so far: %d\n", length);

    // SAFE INPUT — patched
    printf("Enter some text: ");
    if (fgets(buffer, sizeof(buffer), stdin)) {
        buffer[strcspn(buffer, "\n")] = '\0'; // Trim newline
    }

    printf("You entered: %s\n", buffer);
}

int main() {
    foo();
    return 0;
}
