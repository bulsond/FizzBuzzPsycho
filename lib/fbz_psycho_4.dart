import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Pipeline-oriented programming with callable objects
void fbzPsycho4() {
  for (var i = 0; i < totalCount; i++) {
    final output = FizzBuzzInitiator()(i)()()()();
    if (output == null) continue;
    print(output);
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class FizzBuzzData {
  const FizzBuzzData({
    required this.number,
    required this.output,
  });

  final String output;
  final int number;

  FizzBuzzData copyWith({required String output}) {
    return FizzBuzzData(number: number, output: output);
  }
}

class FizzBuzzInitiator {
  const FizzBuzzInitiator();

  FizzBuzzCheckable call(int number) {
    final fzd = FizzBuzzData(number: number, output: '');
    return FizzBuzzCheckable(data: fzd);
  }
}

class FizzBuzzCheckable {
  const FizzBuzzCheckable({required this.data});

  final FizzBuzzData data;

  FizzCheckable call() {
    bool notCheck = false;
    FizzBuzzData newData = data;
    if (data.number % fizzBuzzNumber == 0) {
      notCheck = true;
      newData = data.copyWith(output: 'FizzBuzz,');
    }
    return FizzCheckable(data: newData, isCheckedData: notCheck);
  }
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
    bool notCheck = false;
    FizzBuzzData newData = data;
    if (data.number % fizzNumber == 0) {
      notCheck = true;
      newData = data.copyWith(output: 'Fizz,');
    }
    return BuzzCheckable(data: newData, isCheckedData: notCheck);
  }
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
    FizzBuzzData newData = data;
    if (data.number % buzzNumber == 0) {
      newData = data.copyWith(output: 'Buzz,');
    }
    return Mappable(data: newData);
  }
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
}
