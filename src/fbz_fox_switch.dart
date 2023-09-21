// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Using a Switch
/// author: https://github.com/PlugFox
void main(List<String> args) {
  var f = Frame();
  while (f.counter < 31) {
    switch (f) {
      case Frame(fizz: 0, buzz: 0):
        print('FizzBuzz,');
      case Frame(fizz: 0):
        print('Fizz,');
      case Frame(buzz: 0):
        print('Buzz,');
    }
    f
      ..counter = f.counter + 1
      ..fizz = f.counter % 3
      ..buzz = f.counter % 5;
  }
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Frame {
  int counter = 0;
  int fizz = 0;
  int buzz = 0;
}
