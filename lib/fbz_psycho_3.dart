import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Pipeline-oriented programming by immutable objects
void fbzPsycho3() {
  for (var i = 0; i < totalCount; i++) {
    final output = FizzBazzOutput(number: i, output: '')
        .handle(divisor: 15, message: 'FizzBuzz,')
        .handle(divisor: 3, message: 'Fizz,')
        .handle(divisor: 5, message: 'Buzz,')
        .map();
    if (output == null) continue;
    print(output);
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class FizzBazzOutput {
  const FizzBazzOutput({
    required this.number,
    required this.output,
  });

  final String output;
  final int number;

  FizzBazzOutput handle({
    required int divisor,
    required String message,
  }) {
    if (output.isNotEmpty) {
      return this;
    }
    if (number % divisor != 0) {
      return this;
    }
    return FizzBazzOutput(
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
