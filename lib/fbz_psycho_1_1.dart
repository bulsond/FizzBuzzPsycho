import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// In the style of functional programming using a list
void fbzPsycho1$1() {
  for (var i = 0; i < totalCount; i++) {
    outputs.firstWhere((e) => e.$1(i)).$2(i);
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

final outputs = <(bool Function(int value), void Function(int value))>[
  ((v) => v % fizzBuzzNumber == 0, (_) => print('FizzBuzz,')),
  ((v) => v % fizzNumber == 0, (_) => print('Fizz,')),
  ((v) => v % buzzNumber == 0, (_) => print('Buzz,')),
  ((_) => true, (v) {}),
];
