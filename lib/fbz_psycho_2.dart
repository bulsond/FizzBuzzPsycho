import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Replacing if-else conditions with enum
void fbzPsycho2() {
  for (var i = 0; i < totalCount; i++) {
    OutputType.selectBy(number: i).output(number: i);
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

enum OutputType {
  fizzbuzz(FizzBuzzOutput()),
  fizz(FizzOutput()),
  buzz(BuzzOutput()),
  num(NumberOutput());

  const OutputType(this.output);

  final Output output;

  static OutputType selectBy({required int number}) {
    for (final output in OutputType.values) {
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

  // ignore: avoid_field_initializers_in_const_classes
  final int _divisor = Output.fbDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print(Output.fbOutput);
}

class FizzOutput implements Output {
  const FizzOutput();

  // ignore: avoid_field_initializers_in_const_classes
  final int _divisor = Output.fDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print(Output.fOutput);
}

class BuzzOutput implements Output {
  const BuzzOutput();

  // ignore: avoid_field_initializers_in_const_classes
  final int _divisor = Output.bDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print(Output.bOutput);
}

class NumberOutput implements Output {
  const NumberOutput();

  // ignore: avoid_field_initializers_in_const_classes
  final int _divisor = Output.nDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) {}
}
