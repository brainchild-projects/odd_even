import 'dart:math';

Random random() => Random(DateTime.now().microsecondsSinceEpoch);

typedef IntegerFn = int Function();

abstract class NumberGenerator {
  external int integer(int max, {int min = 0});

  factory NumberGenerator() => _NumberGenerator();
}

class _NumberGenerator implements NumberGenerator {
  @override
  int integer(int max, {int min = 0}) {
    if (max < min) {
      throw ArgumentError('Arguments "min" must not be greater than "max"');
    }
    return random().nextInt(max - min + 1) + min;
  }
}
