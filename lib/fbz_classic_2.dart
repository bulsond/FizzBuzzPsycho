import 'package:fbz/src/constant.dart';

void fbzClassic2() {
  for (var i = 0; i < totalCount; i++) {
    if (i % fizzBuzzNumber == 0) {
      print('FizzBuzz,');
    } else if (i % fizzNumber == 0) {
      print('Fizz,');
    } else if (i % buzzNumber == 0) {
      print('Buzz,');
    } else {}
  }
}
