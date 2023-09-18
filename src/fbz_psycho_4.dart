void main(List<String> args) {
  for (var i = 0; i < 31; i++) {
    final output = FizzBazzInitiator()(i)()()()();
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

  FizzBazzData copyWith({required String output}) {
    return FizzBazzData(number: number, output: output);
  }
}

class FizzBazzInitiator {
  const FizzBazzInitiator();

  FizzBazzCheckable call(int number) {
    final fzd = FizzBazzData(number: number, output: '');
    return FizzBazzCheckable(data: fzd);
  }
}

class FizzBazzCheckable {
  const FizzBazzCheckable({required this.data});

  final FizzBazzData data;

  FizzCheckable call() {
    bool notCheck = false;
    FizzBazzData newData = data;
    if (data.number % 15 == 0) {
      notCheck = true;
      newData = data.copyWith(output: 'FizzBuzz,');
    }
    return FizzCheckable(data: newData, isCheckedData: notCheck);
  }
}

class FizzCheckable {
  const FizzCheckable({required this.data, required this.isCheckedData});

  final FizzBazzData data;
  final bool isCheckedData;

  BazzCheckable call() {
    if (isCheckedData) {
      return BazzCheckable(
        data: data,
        isCheckedData: isCheckedData,
      );
    }
    bool notCheck = false;
    FizzBazzData newData = data;
    if (data.number % 3 == 0) {
      notCheck = true;
      newData = data.copyWith(output: 'Fizz,');
    }
    return BazzCheckable(data: newData, isCheckedData: notCheck);
  }
}

class BazzCheckable {
  const BazzCheckable({
    required this.data,
    required this.isCheckedData,
  });

  final FizzBazzData data;
  final bool isCheckedData;

  Mappable call() {
    if (isCheckedData) {
      return Mappable(data: data);
    }
    FizzBazzData newData = data;
    if (data.number % 5 == 0) {
      newData = data.copyWith(output: 'Buzz,');
    }
    return Mappable(data: newData);
  }
}

class Mappable {
  const Mappable({required this.data});

  final FizzBazzData data;

  String call() {
    if (data.output.isEmpty) {
      return '${data.number},';
    }
    return data.output;
  }
}
