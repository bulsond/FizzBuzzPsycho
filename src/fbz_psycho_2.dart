void main(List<String> args) {
  for (var i = 0; i < 31; i++) {
    OutputType.from(number: i).output(number: i);
  }
}

enum OutputType {
  fizzbuzz(FizzBuzzOutput()),
  fizz(FizzOutput()),
  buzz(BuzzOutput()),
  num(NumberOutput());

  const OutputType(this.output);

  final Output output;

  static OutputType from({required int number}) {
    for (var output in OutputType.values) {
      if (number % output.output.divisor == 0) {
        return output;
      }
    }
    return num;
  }
}

abstract interface class Output {
  static const fbOutput = 'FizzBuzz,';
  static const fOutput = 'Fizz,';
  static const bOutput = 'Buzz,';
  static const fbDivisor = 15;
  static const fDivisor = 3;
  static const bDivisor = 5;
  static const nDivisor = 1;

  int get divisor;
  void call({required int number});
}

class FizzBuzzOutput implements Output {
  const FizzBuzzOutput();

  final int _divisor = Output.fbDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print('${Output.fbOutput}');
}

class FizzOutput implements Output {
  const FizzOutput();

  final int _divisor = Output.fDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print('${Output.fOutput}');
}

class BuzzOutput implements Output {
  const BuzzOutput();

  final int _divisor = Output.bDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print('${Output.bOutput}');
}

class NumberOutput implements Output {
  const NumberOutput();

  final int _divisor = Output.nDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print('${number},');
}
