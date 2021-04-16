import 'package:flutter/material.dart';
import 'package:odd_even/number_generator.dart';
import 'package:odd_even/odd_even_app.dart';
import 'package:odd_even/weighted_range_number_generator.dart';

import 'tiny_app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ng = NumberGenerator();
    final generator = WeightedRangeNumberGenerator([
      WeightedNumberFn(() => ng.integer(10), 1.0),
      WeightedNumberFn(() => ng.integer(100, min: 11), 2.0),
      WeightedNumberFn(() => ng.integer(1000, min: 101), 1.0),
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: TinyAppTheme.lightThemeData,
      home: OddEvenApp(
        numberGenerator: generator.integer,
      ),
    );
  }
}
