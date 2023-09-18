void main(List<String> args) {
  for (var i = 0; i < 31; i++) {
    outputs.firstWhere((e) => e.$1(i)).$2(i);
  }
}

final outputs = <(bool Function(int value), void Function(int value))>[
  ((v) => v % 15 == 0, (v) => print('FizzBuzz,')),
  ((v) => v % 3 == 0, (v) => print('Fizz,')),
  ((v) => v % 5 == 0, (v) => print('Buzz,')),
  ((v) => true, (v) => print('${v},')),
];
