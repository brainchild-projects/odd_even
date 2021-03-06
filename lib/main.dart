import 'package:flutter/material.dart';
import 'package:odd_even/odd_even_app.dart';
import 'package:odd_even/odd_even_quiz_item.dart';
import 'package:provider/provider.dart';

import 'number_generator.dart';
import 'tiny_app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: TinyAppTheme.lightThemeData,
      home: ChangeNotifierProvider(
        create: (context) => OddEvenQuizItem(
          NumberGenerator().integer(100),
        ),
        child: OddEvenApp(),
      ),
    );
  }
}
