import 'package:flutter_test/flutter_test.dart';
import 'package:odd_even/weighted_range_number_generator.dart';

typedef IntFn = int Function();

void main() {
  group(WeightedRangeNumberGenerator, () {
    late WeightedRangeNumberGenerator generator;

    group('errors', () {
      test('throws argument error when constructed with empty list,', () {
        expect(() => WeightedRangeNumberGenerator([]), throwsArgumentError);
      });
    });

    group('integer() with a single range', () {
      setUp(() {
        generator = WeightedRangeNumberGenerator([
          WeightedNumberFn(() => 1),
        ]);
      });

      test('it always uses result from one', () {
        final generated = <int>[];
        for (var i = 0; i < 10; i++) {
          final number = generator.integer();
          generated.add(number);
          expect(
            number,
            equals(1),
            reason: 'Generated: ${generated.join(", ")}',
          );
        }
      });
    });

    group('integer() with 2 generators', () {
      setUp(() {
        generator = WeightedRangeNumberGenerator([
          WeightedNumberFn(() => 1),
          WeightedNumberFn(() => 2),
        ]);
      });

      test('it weighs them .5 each', () {
        int ones = 0;
        int twos = 0;
        for (var i = 0; i < 100; i++) {
          final number = generator.integer();
          switch (number) {
            case 1:
              ones++;
              break;
            case 2:
              twos++;
              break;
            default:
              fail('Was expecting 1 or 2 to be generated. Got $number');
          }
        }

        expect(ones, greaterThan(40));
        expect(twos, greaterThan(40));
      });
    });

    group('integer() with 2 unbalanced generators', () {
      setUp(() {
        generator = WeightedRangeNumberGenerator([
          WeightedNumberFn(() => 1, 1.0),
          WeightedNumberFn(() => 2, 2.0),
        ]);
      });

      test('it weighs them differently', () {
        int ones = 0;
        int twos = 0;
        for (var i = 0; i < 100; i++) {
          final number = generator.integer();
          switch (number) {
            case 1:
              ones++;
              break;
            case 2:
              twos++;
              break;
            default:
              fail('Was expecting 1 or 2 to be generated. Got $number');
          }
        }

        expect(ones, lessThan(50));
        expect(twos, greaterThan(50));
      });
    });
  });
}
