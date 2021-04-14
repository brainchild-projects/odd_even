import 'package:flutter_test/flutter_test.dart';
import 'package:odd_even/number_generator.dart';

void main() {
  group(NumberGenerator, () {
    final generator = NumberGenerator();
    group('integer()', () {
      group('errors', () {
        test(
            'throws ArgumentError when max is less than min with correct message',
            () {
          try {
            generator.integer(50, min: 51);
          } catch (e) {
            if (e is! ArgumentError) {
              fail('Expected ArgumentError');
            }
            expect(
              e.message,
              equals('Arguments "min" must not be greater than "max"'),
            );
          }
        });
      });

      test('it generates numbers 0 when specified', () {
        final generated = <int>[];
        for (var i = 0; i < 10; i++) {
          final number = generator.integer(0);
          generated.add(number);
          expect(
            number,
            equals(0),
            reason: 'Generated: ${generated.join(", ")}',
          );
        }
      });

      test('it generates numbers 1 when specified', () {
        final generated = <int>[];
        for (var i = 0; i < 10; i++) {
          final number = generator.integer(1, min: 1);
          generated.add(number);
          expect(
            number,
            equals(1),
            reason: 'Generated: ${generated.join(", ")}',
          );
        }
      });

      test('it generates numbers 0 or 1 when specified', () {
        int ones = 0;
        int zeroes = 0;
        for (var i = 0; i < 100; i++) {
          final num = generator.integer(1);
          if (num == 0) {
            zeroes++;
          } else if (num == 1) {
            ones++;
          } else {
            fail('Expected 0 or 1 but got $num');
          }
        }
        expect(
          ones,
          greaterThan(20),
          reason: 'Unexpected number of minimum ones: $ones',
        );
        expect(
          zeroes,
          greaterThan(20),
          reason: 'Unexpected number of minimum zeroes: $zeroes',
        );
      });

      test('it can generate negative integers when specified', () {
        final generated = <int>[];
        for (var i = 0; i < 100; i++) {
          final number = generator.integer(-2, min: -4);
          generated.add(number);
          expect(
            number,
            lessThan(-1),
            reason: 'Generated: ${generated.join(", ")}',
          );
          expect(
            number,
            greaterThan(-5),
            reason: 'Generated: ${generated.join(", ")}',
          );
        }
      });
    });
  });
}
