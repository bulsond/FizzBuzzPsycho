// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Using a Result object
void main(List<String> args) {
  for (var i = 0; i < 31; i++) {
    final result = FizzBuzzResult.number(number: i)
        .collate((value) => value % 15 == 0, 'FizzBuzz,')
        .collate((value) => value % 3 == 0, 'Fizz,')
        .collate((value) => value % 5 == 0, 'Buzz,');
    if (result.isMessage) {
      print(result.message);
      continue;
    }
    print(result.number);
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

  factory FizzBuzzResult.number({required int number}) {
    return FizzBuzzResult(number: number, message: '');
  }

  factory FizzBuzzResult.message({required String message}) {
    return FizzBuzzResult(number: -1, message: message);
  }

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
