void main(List<String> args) {
  for (var i = 0; i < 31; i++) {
    final output = FizzBuzzInitiator()
        .run(number: i)
        .checkToFizzBuzz()
        .checkToFizz()
        .checkToBuzz()
        .map();
    print(output);
  }
}

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

  FizzBuzzCheckable run({required int number}) {
    return call(number);
  }
}

class FizzBuzzCheckable {
  const FizzBuzzCheckable({required this.data});

  final FizzBuzzData data;

  FizzCheckable call() {
    bool notCheck = false;
    FizzBuzzData newData = data;
    if (data.number % 15 == 0) {
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
    bool notCheck = false;
    FizzBuzzData newData = data;
    if (data.number % 3 == 0) {
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
    FizzBuzzData newData = data;
    if (data.number % 5 == 0) {
      newData = data.copyWith(output: 'Buzz,');
    }
    return Mappable(data: newData);
  }

  Mappable checkToBuzz() => call();
}

class Mappable {
  const Mappable({required this.data});

  final FizzBuzzData data;

  String call() {
    if (data.output.isEmpty) {
      return '${data.number},';
    }
    return data.output;
  }

  String map() => call();
}
