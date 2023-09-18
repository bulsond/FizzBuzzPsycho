void main(List<String> args) {
  for (var i = 0; i < 31; i++) {
    PrinterType.from(number: i).print(number: i);
  }
}

enum PrinterType {
  fizzbuzz(FizzBuzzPrinter()),
  fizz(FizzPrinter()),
  buzz(BuzzPrinter()),
  num(NumberPrinter());

  const PrinterType(this.print);

  final Printer print;

  static PrinterType from({required int number}) {
    for (var output in PrinterType.values) {
      if (number % output.print.divisor == 0) {
        return output;
      }
    }
    return num;
  }
}

abstract interface class Printer {
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

class FizzBuzzPrinter implements Printer {
  const FizzBuzzPrinter();

  final int _divisor = Printer.fbDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print('${Printer.fbOutput}');
}

class FizzPrinter implements Printer {
  const FizzPrinter();

  final int _divisor = Printer.fDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print('${Printer.fOutput}');
}

class BuzzPrinter implements Printer {
  const BuzzPrinter();

  final int _divisor = Printer.bDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print('${Printer.bOutput}');
}

class NumberPrinter implements Printer {
  const NumberPrinter();

  final int _divisor = Printer.nDivisor;

  @override
  int get divisor => _divisor;

  @override
  void call({required int number}) => print('${number},');
}
