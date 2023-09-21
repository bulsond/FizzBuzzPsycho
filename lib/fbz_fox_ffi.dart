import 'dart:ffi';
import 'dart:io' as io;

import 'package:fbz/src/constant.dart';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as p;

final DynamicLibrary _lib = io.Platform.isWindows
    ? DynamicLibrary.open(p.join('build', 'libfizzbuzz.dll'))
    : DynamicLibrary.open(p.join('build', 'libfizzbuzz.so'));

final _fn = _lib.lookupFunction<
    Int32 Function(Int32, Int32, Int32, Pointer<Int32>),
    int Function(int, int, int, Pointer<Int32>)>('fizz_buzz');

void $initFox$FFI$DynamicLibrary() {
  // ignore: unnecessary_statements
  _fn;
}

void fbzFox$FFI() {
  final resultPointer = calloc<Int32>(totalCount);
  try {
    var count = _fn(totalCount, fizzNumber, buzzNumber, resultPointer);
    // if-else is faster than switch
    for (var i = 0, value = resultPointer[i];
        i < count;
        i++, value = resultPointer[i]) {
      if (value == 1) {
        print('Fizz,');
      } else if (value == 2) {
        print('Buzz,');
      } else if (value == 3) {
        print('FizzBuzz,');
      } else {
        throw Exception('Unknown result: $value');
      }
    }
  } finally {
    calloc.free(resultPointer);
  }
}
