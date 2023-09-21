import 'dart:async';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:fbz/fbz_classic_1.dart';
import 'package:fbz/fbz_classic_2.dart';
import 'package:fbz/fbz_fox_algorithm.dart';
import 'package:fbz/fbz_fox_ffi.dart';
import 'package:fbz/fbz_fox_switch.dart';
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

/// Benchmark for all FizzBuzz algorithms
///
/// How to run:
/// dart run bin/benchmark.dart
///
/// dart compile exe bin/benchmark.dart -o benchmark.exe
/// ./benchmark.exe
void main() => Future<void>(() async {
      $initFox$FFI$DynamicLibrary();
      final cases = <({String name, FutureOr<void> Function() fn})>[
        (name: 'fox_algorithm', fn: fbzFox$Algorithm),
        (name: 'fox_ffi', fn: fbzFox$FFI),
        (name: 'fox_switch', fn: fbzFox$Switch),
        (name: 'classic_1', fn: fbzClassic1),
        (name: 'classic_2', fn: fbzClassic2),
        (name: 'psycho_1_1', fn: fbzPsycho1$1),
        (name: 'psycho_1', fn: fbzPsycho1),
        (name: 'psycho_2', fn: fbzPsycho2),
        (name: 'psycho_3_1', fn: fbzPsycho3$1),
        (name: 'psycho_3', fn: fbzPsycho3),
        (name: 'psycho_4_1', fn: fbzPsycho4$1),
        (name: 'psycho_4', fn: fbzPsycho4),
        (name: 'psycho_5', fn: fbzPsycho5),
        (name: 'psycho_6', fn: fbzPsycho6),
        (name: 'psycho_7', fn: fbzPsycho7),
        (name: 'psycho_8', fn: fbzPsycho8),
      ];
      final results = <({String name, double score})>[];
      final completer = Completer<void>.sync();
      runZoned<void>(
        () async {
          try {
            for (final c in cases) {
              final benchmark = Benchmark(c.name, c.fn);
              results.add((name: c.name, score: await benchmark.measure()));
            }
            completer.complete();
          } on Object catch (error, stackTrace) {
            completer.completeError(error, stackTrace);
          }
        },
        zoneSpecification: ZoneSpecification(
          print: (_, __, ___, msg) {},
        ),
      );
      await completer.future;
      results.sort((a, b) => a.score.compareTo(b.score));
      for (final r in results) {
        print('${r.name}: ${r.score.round()}');
      }
    });

final class Benchmark extends AsyncBenchmarkBase {
  Benchmark(super.name, this.fn);

  final FutureOr<void> Function() fn;

  @override
  Future<void> run() async {
    await fn();
  }
}
