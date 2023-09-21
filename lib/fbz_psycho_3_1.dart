import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Pipeline-oriented programming by extension methods
void fbzPsycho3$1() {
  for (var i = 0; i < totalCount; i++) {
    final output = FizzBazzData(number: i, output: '')
        .handle(divisor: 15, message: 'FizzBuzz,')
        .handle(divisor: 3, message: 'Fizz,')
        .handle(divisor: 5, message: 'Buzz,')
        .map();
    if (output == null) continue;
    print(output);
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class FizzBazzData {
  const FizzBazzData({
    required this.number,
    required this.output,
  });

  final String output;
  final int number;
}

extension on FizzBazzData {
  FizzBazzData handle({
    required int divisor,
    required String message,
  }) {
    if (output.isNotEmpty) {
      return this;
    }
    if (number % divisor != 0) {
      return this;
    }
    return FizzBazzData(
      number: number,
      output: message,
    );
  }

  String? map() {
    if (output.isEmpty) {
      return null;
    }
    return output;
  }
}
