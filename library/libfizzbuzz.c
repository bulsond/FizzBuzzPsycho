#include "libfizzbuzz.h"

int32_t fizz_buzz(int32_t totalCount, int32_t fizzNumber, int32_t buzzNumber,
                  int32_t *output) {
    int32_t fizzBuzzNumber = fizzNumber * buzzNumber;
    int32_t outputCount = 0;

    for (int32_t i = 0; i < totalCount; i++) {
        if (i % fizzBuzzNumber == 0) {
            output[outputCount] = 3; // FizzBuzz
            outputCount++;
        } else if (i % fizzNumber == 0) {
            output[outputCount] = 1; // Fizz
            outputCount++;
        } else if (i % buzzNumber == 0) {
            output[outputCount] = 2; // Buzz
            outputCount++;
        }
    }
    return outputCount;
}
