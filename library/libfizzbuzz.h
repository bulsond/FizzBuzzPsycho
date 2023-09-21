#ifndef libfizzbuzz_h
#define libfizzbuzz_h

#include <stdint.h>

/**
 * Applies the FizzBuzz algorithm to a range of integers and writes the results
 * to a character buffer.
 *
 * @param N The number of integers to apply the FizzBuzz algorithm to.
 * @param fizz_num The integer to use for "Fizz" replacements.
 * @param buzz_num The integer to use for "Buzz" replacements.
 * @param output A buffer to write the FizzBuzz results to.
 * - 1: for Fizz
 * - 2: for Buzz
 * - 3: for FizzBuzz
 */
/* DART_EXPORT */ int32_t fizz_buzz(int32_t totalCount, int32_t fizzNumber,
                                    int32_t buzzNumber, int32_t *output);

#endif
