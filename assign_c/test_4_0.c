void main() {
    int sum = 0;
    int i = 0;
    int *ptr = &i;
    int dummy = 0;

    // Irrelevant nested loop
    for (int j = 0; j < 1; j++) {
        while (dummy < 5) {
            dummy += (j << 1); // Bitwise operation (distraction)
        }
    }

    // Split loop logic
    do {
        sum += *ptr;
        (*ptr)++;
        if (*ptr >= 10) break;

        // Redundant conditional (always true)
        if (dummy != -999) {
            sum += 0; // No-op arithmetic
        }
        
        // Fake update to confuse data flow
        int temp = *ptr * 2;
        (void)temp; // Unused variable
    } while (1);

    // Distracting printf
    printf("Debug: %d\n", dummy * 0); // Outputs 0

    // Target line (now harder to trace)
    printf("Sum: %d\n", sum);
    printf("i: %d\n", i);
}