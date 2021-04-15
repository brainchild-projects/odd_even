import 'package:flutter/material.dart';

import 'number_generator.dart';
import 'odd_even_quiz_item.dart';
import 'quiz_item.dart';
import 'quiz_item_widget.dart';
import 'screens/problem_screen.dart';
import 'screens/solution_screen.dart';

class OddEvenApp extends StatefulWidget {
  final NumberGenerator numberGenerator;

  OddEvenApp({Key? key, required this.numberGenerator}) : super(key: key);

  @override
  _OddEvenAppState createState() => _OddEvenAppState(numberGenerator);
}

class _OddEvenAppState extends State<OddEvenApp> {
  final NumberGenerator numberGenerator;
  QuizItem quizItem;

  _OddEvenAppState(this.numberGenerator)
      : quizItem = OddEvenQuizItem(numberGenerator.integer(100));

  @override
  Widget build(BuildContext context) {
    return QuizItemWidget(
      quizItem,
      problemScreen: (item) => ProblemScreen(item as OddEvenQuizItem),
      evaluationScreen: (item) => SolutionScreen(item as OddEvenQuizItem),
    );
  }
}
