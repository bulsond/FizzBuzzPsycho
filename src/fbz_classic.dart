void main(List<String> args) {
  for (var i = 0; i < 31; i++) {
    if (i % 15 == 0) {
      print('FizzBuzz,');
    } else if (i % 3 == 0) {
      print('Fizz,');
    } else if (i % 5 == 0) {
      print('Buzz,');
    } else {
      print('${i},');
    }
  }
}
