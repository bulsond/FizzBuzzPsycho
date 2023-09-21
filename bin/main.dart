import 'dart:async';
import 'dart:io' as io;

import 'package:args/args.dart';
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
import 'package:stack_trace/stack_trace.dart' as st;

/// Router for all FizzBuzz algorithms
///
/// How to run:
/// dart run bin/main.dart -a=fox_algorithm
///
/// dart compile exe bin/main.dart -o fbz.exe
/// ./fbz.exe -a=fox_algorithm
void main(List<String> args) => runZonedGuarded<void>(() async {
      final parser = ArgParser()
        ..addOption('algorithm', abbr: 'a', help: 'Algorithm to use')
        ..addFlag('help', abbr: 'h', help: 'Show help', negatable: false);
      final argResults = parser.parse(args);
      if (argResults['help'] == true) {
        print(parser.usage);
        io.exit(0);
      }
      final option = (argResults['algorithm'] ??
              io.Platform.environment['FBZ_ALGORITHM'] ??
              const String.fromEnvironment('FBZ_ALGORITHM', defaultValue: ''))
          .toString()
          .trim()
          .replaceAll(' ', '')
          .replaceAll('=', '')
          .replaceAll('-', '')
          .toLowerCase();
      switch (option) {
        case 'fox_algorithm':
          fbzFox$Algorithm();
        case 'fox_ffi':
          fbzFox$FFI();
        case 'fox_switch':
          fbzFox$Switch();
        case 'classic_1':
          fbzClassic1();
        case 'classic_2':
          fbzClassic2();
        case 'psycho_1_1':
          fbzPsycho1$1();
        case 'psycho_1':
          fbzPsycho1();
        case 'psycho_2':
          fbzPsycho2();
        case 'psycho_3_1':
          fbzPsycho3$1();
        case 'psycho_3':
          fbzPsycho3();
        case 'psycho_4_1':
          fbzPsycho4$1();
        case 'psycho_4':
          fbzPsycho4();
        case 'psycho_5':
          fbzPsycho5();
        case 'psycho_6':
          fbzPsycho6();
        case 'psycho_7':
          await fbzPsycho7();
        case 'psycho_8':
          fbzPsycho8();
        case '':
          print('No algorithm specified');
          print(parser.usage);
          io.exit(1);
        default:
          print('Unknown option: $option');
          io.exit(1);
      }
      io.exit(0);
    }, (error, stackTrace) {
      print('Fatal exception: $error\n' '${st.Trace.format(stackTrace)}');
      io.exit(1);
    });
