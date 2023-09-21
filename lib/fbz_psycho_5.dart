import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Decorator Pattern
void fbzPsycho5() {
  const fbOutput = FizzBuzzOutput(
    outputCapable: BuzzCapable(
      outputCapable: FizzCapable(
        outputCapable: FizzBuzzCapable(
          outputCapable: DeadCapable(),
        ),
      ),
    ),
  );

  for (var i = 0; i < totalCount; i++) {
    final output = fbOutput.getFor(number: i);
    if (output == null) continue;
    print(output);
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class FizzBuzzOutput {
  const FizzBuzzOutput({required this.outputCapable});

  final OutputCapable outputCapable;

  String? getFor({required int number}) {
    final text = outputCapable.getOutputText(number: number);
    if (text.isEmpty) {
      return null;
    }
    return text;
  }
}

abstract class OutputCapable {
  const OutputCapable();

  OutputCapable get outputCapable;
  int get divisor;
  String get message;

  String getOutputText({required int number}) {
    final text = outputCapable.getOutputText(number: number);
    if (text.isNotEmpty) {
      return text;
    }
    if (number % divisor == 0) {
      return message;
    }
    return '';
  }
}

class BuzzCapable extends OutputCapable {
  const BuzzCapable({required this.outputCapable});

  @override
  final OutputCapable outputCapable;

  @override
  int get divisor => 5;

  @override
  String get message => 'Buzz,';
}

class FizzCapable extends OutputCapable {
  const FizzCapable({required this.outputCapable});

  @override
  final OutputCapable outputCapable;

  @override
  int get divisor => 3;

  @override
  String get message => 'Fizz,';
}

class FizzBuzzCapable extends OutputCapable {
  const FizzBuzzCapable({required this.outputCapable});

  @override
  final OutputCapable outputCapable;

  @override
  int get divisor => 15;

  @override
  String get message => 'FizzBuzz,';
}

class DeadCapable extends OutputCapable {
  const DeadCapable();

  @override
  OutputCapable get outputCapable => throw UnimplementedError();

  @override
  int get divisor => throw UnimplementedError();

  @override
  String get message => throw UnimplementedError();

  @override
  String getOutputText({required int number}) => '';
}
