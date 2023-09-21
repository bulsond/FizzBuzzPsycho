import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Using a Result object
void fbzPsycho8() {
  for (var i = 0; i < totalCount; i++) {
    final result = FizzBuzzResult.number(number: i)
        .collate((value) => value % fizzBuzzNumber == 0, 'FizzBuzz,')
        .collate((value) => value % fizzNumber == 0, 'Fizz,')
        .collate((value) => value % buzzNumber == 0, 'Buzz,');
    if (result.isMessage) {
      print(result.message);
      continue;
    }
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class FizzBuzzResult {
  const FizzBuzzResult({
    required this.number,
    required this.message,
  });

  final int number;
  final String message;

  factory FizzBuzzResult.number({required int number}) =>
      FizzBuzzResult(number: number, message: '');

  factory FizzBuzzResult.message({required String message}) =>
      FizzBuzzResult(number: -1, message: message);

  bool get isNumber => message.isEmpty;
  bool get isMessage => message.isNotEmpty;
}

extension on FizzBuzzResult {
  FizzBuzzResult collate(bool Function(int value) predicate, String message) {
    if (isMessage) {
      return this;
    }
    return predicate(number) ? FizzBuzzResult.message(message: message) : this;
  }
}
