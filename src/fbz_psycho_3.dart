void main(List<String> args) {
  for (var i = 0; i < 31; i++) {
    final output = FizzBazzData(number: i, output: '')
        .handle(divisor: 15, message: 'FizzBuzz,')
        .handle(divisor: 3, message: 'Fizz,')
        .handle(divisor: 5, message: 'Buzz,')
        .map();
    print(output);
  }
}

class FizzBazzData {
  const FizzBazzData({
    required this.number,
    required this.output,
  });

  final String output;
  final int number;
}

extension FizzBazzExts on FizzBazzData {
  FizzBazzData handle({required int divisor, required String message}) {
    if (output.isNotEmpty) {
      return this; // уже обработан
    }
    if (number % divisor != 0) {
      return this; // не подходит под условие делимости
    }
    return FizzBazzData(
      number: number,
      output: message,
    );
  }

  String map() {
    if (output.isEmpty) {
      return '$number,';
    }
    return output;
  }
}
