import 'package:fbz/src/constant.dart';

void fbzClassic1() {
  for (var i = 0; i < totalCount; i++) {
    if (i % fizzBuzzNumber == 0) {
      print('FizzBuzz,');
      continue;
    }
    if (i % fizzNumber == 0) {
      print('Fizz,');
      continue;
    }
    if (i % buzzNumber == 0) {
      print('Buzz,');
      continue;
    }
  }
}
