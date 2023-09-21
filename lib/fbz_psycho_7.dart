import 'dart:async';

import 'package:fbz/src/constant.dart';

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
/// Using a StreamController
Future<void> fbzPsycho7() async {
  final controller = StreamController<Object?>(sync: true);
  final fbOutput = FizzBuzzOutput(
    controller: controller,
    fizzBuzzTrans: const FizzBuzzTrans(),
    fizzTrans: const FizzTrans(),
    buzzTrans: const BuzzTrans(),
  )..init();

  for (var i = 0; i < totalCount; i++) {
    fbOutput.outputFor(number: i);
  }

  await controller.close();
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class FizzBuzzOutput {
  const FizzBuzzOutput({
    required this.controller,
    required this.fizzBuzzTrans,
    required this.fizzTrans,
    required this.buzzTrans,
  });

  final StreamController<Object?> controller;
  final FBTrans fizzBuzzTrans;
  final FBTrans fizzTrans;
  final FBTrans buzzTrans;

  void init() {
    controller.stream
        .transform(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) => fizzBuzzTrans.handle(
              data: data,
              sink: sink,
            ),
          ),
        )
        .transform(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) => fizzTrans.handle(
              data: data,
              sink: sink,
            ),
          ),
        )
        .transform(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) => buzzTrans.handle(
              data: data,
              sink: sink,
            ),
          ),
        )
        .where((data) => data is String)
        .listen(print);
  }

  void outputFor({required int number}) {
    controller.sink.add(number);
  }
}

abstract class FBTrans {
  const FBTrans();

  String get message;
  int get divisor;

  void handle({required Object? data, required EventSink<Object?> sink}) {
    if (data is String) {
      sink.add(data);
      return;
    }
    if ((data as int) % divisor == 0) {
      sink.add(message);
      return;
    }
    sink.add(data);
  }
}

class FizzBuzzTrans extends FBTrans {
  const FizzBuzzTrans();

  @override
  int get divisor => 15;

  @override
  String get message => 'FizzBuzz,';
}

class FizzTrans extends FBTrans {
  const FizzTrans();

  @override
  int get divisor => 3;

  @override
  String get message => 'Fizz,';
}

class BuzzTrans extends FBTrans {
  const BuzzTrans();

  @override
  int get divisor => 5;

  @override
  String get message => 'Buzz,';
}
