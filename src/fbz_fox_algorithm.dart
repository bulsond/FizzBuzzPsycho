import 'dart:math' as math;

/// Fizz number.
const int fizzNumber = 3;

/// Buzz number.
const int buzzNumber = 5;

/// FizzBuzz number.
const int fizzBuzzNumber = fizzNumber * buzzNumber;

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// author: https://github.com/PlugFox
void main(List<String> args) {
  for (var i = 0, f = fizzNumber, b = buzzNumber; i < 31; i++, f++, b++) {
    if (f != fizzNumber && b != buzzNumber) {
      continue;
    } else if (f == fizzNumber && b == buzzNumber) {
      print('FizzBuzz,');
      i += f = b = math.min(fizzNumber, buzzNumber) - 1;
    } else if (f == fizzNumber) {
      print('Fizz,');
      f = 0;
    } else if (b == buzzNumber) {
      print('Buzz,');
      b = 0;
    }
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
