import 'dart:async';

import 'package:fbz/fbz_classic_1.dart';
import 'package:fbz/fbz_classic_2.dart';
import 'package:fbz/fbz_fox_algorithm.dart';
import 'package:fbz/fbz_fox_ffi.dart';
import 'package:fbz/fbz_psycho_1.dart';
import 'package:fbz/fbz_psycho_1_1.dart';
import 'package:fbz/fbz_psycho_2.dart';
import 'package:fbz/fbz_psycho_3.dart';
import 'package:fbz/fbz_psycho_3_1.dart';
import 'package:fbz/fbz_psycho_4.dart';
import 'package:fbz/fbz_psycho_4_1.dart';
import 'package:fbz/fbz_psycho_5.dart';
import 'package:fbz/fbz_psycho_6.dart';
import 'package:fbz/fbz_psycho_7.dart';
import 'package:fbz/fbz_psycho_8.dart';
import 'package:test/test.dart';

void main() => group(
      'FBZ',
      () {
        late final StreamMatcher matcher;

        setUpAll(() async {
          final output = await handlePrints(fbzClassic1).toList();
          matcher = emitsInOrder(<Object?>[...output, emitsDone]);
        });

        test('fox_algorithm', () {
          expectLater(handlePrints(fbzFox$Algorithm), matcher);
        });

        test('fox_ffi', () {
          expectLater(handlePrints(fbzFox$FFI), matcher);
        });

        test('classic_1', () {
          expectLater(handlePrints(fbzClassic1), matcher);
        });

        test('classic_2', () {
          expectLater(handlePrints(fbzClassic2), matcher);
        });

        test('psycho_1_1', () {
          expectLater(handlePrints(fbzPsycho1$1), matcher);
        });

        test('psycho_1', () {
          expectLater(handlePrints(fbzPsycho1), matcher);
        });

        test('psycho_2', () {
          expectLater(handlePrints(fbzPsycho2), matcher);
        });

        test('psycho_3_1', () {
          expectLater(handlePrints(fbzPsycho3$1), matcher);
        });

        test('psycho_3', () {
          expectLater(handlePrints(fbzPsycho3), matcher);
        });

        test('psycho_4_1', () {
          expectLater(handlePrints(fbzPsycho4$1), matcher);
        });

        test('psycho_4', () {
          expectLater(handlePrints(fbzPsycho4), matcher);
        });

        test('psycho_5', () {
          expectLater(handlePrints(fbzPsycho5), matcher);
        });

        test('psycho_6', () {
          expectLater(handlePrints(fbzPsycho6), matcher);
        });

        test('psycho_7', () {
          expectLater(handlePrints(fbzPsycho7), matcher);
        });

        test('psycho_8', () {
          expectLater(handlePrints(fbzPsycho8), matcher);
        });
      },
    );

Stream<String> handlePrints(FutureOr<void> Function() fn) {
  final controller = StreamController<String>();
  runZoned<void>(
    () async {
      try {
        await fn();
      } finally {
        await controller.close();
      }
    },
    zoneSpecification: ZoneSpecification(
      print: (_, __, ___, msg) => controller.add(msg),
    ),
  );
  return controller.stream;
}
