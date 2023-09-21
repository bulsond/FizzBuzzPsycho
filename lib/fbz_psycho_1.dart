import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// In the style of functional programming using a map
void fbzPsycho1() {
  for (var i = 0; i < totalCount; i++) {
    outputs.entries.firstWhere((e) => e.key(i)).value(i);
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

final outputs = <bool Function(int value), void Function(int value)>{
  (v) => v % fizzBuzzNumber == 0: (_) => print('FizzBuzz,'),
  (v) => v % fizzNumber == 0: (_) => print('Fizz,'),
  (v) => v % buzzNumber == 0: (_) => print('Buzz,'),
  (_) => true: (v) {},
};
