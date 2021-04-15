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
  late QuizItem quizItem;

  _OddEvenAppState(this.numberGenerator) {
    _generateQuiz();
  }

  _generateQuiz() {
    quizItem = OddEvenQuizItem(numberGenerator.integer(100));
    quizItem.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final evaluator = (evaluation) {
      setState(() {
        _generateQuiz();
      });
    };

    return QuizItemWidget(
      quizItem,
      problemScreen: () => ProblemScreen(quizItem as OddEvenQuizItem),
      evaluationScreen: () => SolutionScreen(
        quizItem as OddEvenQuizItem,
        onDone: evaluator,
      ),
    );
  }
}
