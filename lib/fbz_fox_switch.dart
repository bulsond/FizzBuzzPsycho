import 'package:fbz/src/constant.dart';

class Frame {
  int counter = 0;
  int fizz = 0;
  int buzz = 0;
}

void fbzFox$Switch() {
  var f = Frame();
  while (f.counter < totalCount) {
    switch (f) {
      case Frame(fizz: 0, buzz: 0):
        print('FizzBuzz,');
      case Frame(fizz: 0):
        print('Fizz,');
      case Frame(buzz: 0):
        print('Buzz,');
    }
    f
      ..counter = f.counter + 1
      ..fizz = f.counter % fizzNumber
      ..buzz = f.counter % buzzNumber;
  }
}
