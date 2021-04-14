import 'dart:math';

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
    return _random().nextInt(max - min + 1) + min;
  }

  Random _random() => Random(DateTime.now().microsecondsSinceEpoch);
}
