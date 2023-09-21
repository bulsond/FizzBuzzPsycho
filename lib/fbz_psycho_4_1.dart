import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Pipeline-oriented programming by interconnected objects
void fbzPsycho4$1() {
  for (var i = 0; i < totalCount; i++) {
    final output = const FizzBuzzInitiator()
        .run(number: i)
        .checkToFizzBuzz()
        .checkToFizz()
        .checkToBuzz()
        .map();
    if (output == null) continue;
    print(output);
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class FizzBuzzData {
  const FizzBuzzData({
    required this.number,
    required this.output,
  });

  final String output;
  final int number;

  FizzBuzzData copyWith({required String output}) =>
      FizzBuzzData(number: number, output: output);
}

class FizzBuzzInitiator {
  const FizzBuzzInitiator();

  FizzBuzzCheckable call(int number) {
    final fzd = FizzBuzzData(number: number, output: '');
    return FizzBuzzCheckable(data: fzd);
  }

  FizzBuzzCheckable run({required int number}) => call(number);
}

class FizzBuzzCheckable {
  const FizzBuzzCheckable({required this.data});

  final FizzBuzzData data;

  FizzCheckable call() {
    var notCheck = false;
    var newData = data;
    if (data.number % fizzBuzzNumber == 0) {
      notCheck = true;
      newData = data.copyWith(output: 'FizzBuzz,');
    }
    return FizzCheckable(data: newData, isCheckedData: notCheck);
  }

  FizzCheckable checkToFizzBuzz() => call();
}

class FizzCheckable {
  const FizzCheckable({required this.data, required this.isCheckedData});

  final FizzBuzzData data;
  final bool isCheckedData;

  BuzzCheckable call() {
    if (isCheckedData) {
      return BuzzCheckable(
        data: data,
        isCheckedData: isCheckedData,
      );
    }
    var notCheck = false;
    var newData = data;
    if (data.number % fizzNumber == 0) {
      notCheck = true;
      newData = data.copyWith(output: 'Fizz,');
    }
    return BuzzCheckable(data: newData, isCheckedData: notCheck);
  }

  BuzzCheckable checkToFizz() => call();
}

class BuzzCheckable {
  const BuzzCheckable({
    required this.data,
    required this.isCheckedData,
  });

  final FizzBuzzData data;
  final bool isCheckedData;

  Mappable call() {
    if (isCheckedData) {
      return Mappable(data: data);
    }
    var newData = data;
    if (data.number % buzzNumber == 0) {
      newData = data.copyWith(output: 'Buzz,');
    }
    return Mappable(data: newData);
  }

  Mappable checkToBuzz() => call();
}

class Mappable {
  const Mappable({required this.data});

  final FizzBuzzData data;

  String? call() {
    if (data.output.isEmpty) {
      return null;
    }
    return data.output;
  }

  String? map() => call();
}
