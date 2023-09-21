import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Chain of Responsibility Pattern
void fbzPsycho6() {
  final output = FizzBuzzOutput(
    handler: FizzBuzzHandler(
      next: FizzHandler(
        next: BuzzHandler(
          next: NumberHandler(next: null),
        ),
      ),
    ),
  );
  for (var i = 0; i < totalCount; i++) {
    output.printFor(number: i);
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class FizzBuzzOutput {
  const FizzBuzzOutput({required this.handler});

  final Handler handler;

  void printFor({required int number}) {
    handler.handle(number: number);
  }
}

abstract class Handler {
  const Handler({required this.next});

  final Handler? next;

  int get divisor;
  String get message;

  void handle({required int number}) {
    if (message.isEmpty) {
      return;
    }
    if (number % divisor == 0) {
      print(message);
      return;
    }
    next?.handle(number: number);
  }
}

class FizzBuzzHandler extends Handler {
  const FizzBuzzHandler({required super.next});

  @override
  int get divisor => 15;

  @override
  String get message => 'FizzBuzz,';
}

class FizzHandler extends Handler {
  const FizzHandler({required super.next});

  @override
  int get divisor => 3;

  @override
  String get message => 'Fizz,';
}

class BuzzHandler extends Handler {
  const BuzzHandler({required super.next});

  @override
  int get divisor => 5;

  @override
  String get message => 'Buzz,';
}

class NumberHandler extends Handler {
  const NumberHandler({required super.next});

  @override
  int get divisor => 1;

  @override
  String get message => '';
}
