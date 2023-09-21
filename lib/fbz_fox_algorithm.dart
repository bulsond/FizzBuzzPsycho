import 'dart:math' as math;

import 'package:fbz/src/constant.dart';

void fbzFox$Algorithm() {
  for (var i = 0, f = fizzNumber, b = buzzNumber;
      i < totalCount;
      i++, f++, b++) {
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
