import 'package:equatable/equatable.dart';

import 'number_generator.dart';

class WeightedRangeNumberGenerator {
  final List<WeightedNumberFn> generators;
  final List<double> _positions = [];

  WeightedRangeNumberGenerator(this.generators) {
    if (generators.isEmpty) {
      throw ArgumentError('Number generators must not be empty');
    }
    double weight = 0.0;
    final List<double> prepositions = [];
    for (final weighted in generators) {
      weight += weighted.weight;
      prepositions.add(weight);
    }
    for (final position in prepositions) {
      _positions.add(position / weight);
    }
  }

  int integer() {
    final roll = random().nextDouble();
    final len = _positions.length;
    for (var i = 0; i < len; i++) {
      if (roll <= _positions[i]) {
        return this.generators[i].function();
      }
    }
    throw StateError('Unexpected missed roll.');
  }
}

class WeightedNumberFn with EquatableMixin {
  final double weight;
  final IntegerFn function;

  WeightedNumberFn(this.function, [this.weight = 1.0]);

  @override
  List<Object> get props => [weight, function];
}
