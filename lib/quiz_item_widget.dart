import 'package:flutter/material.dart';

import 'quiz_item.dart';

typedef QuizWidgetScreen = Widget Function();

typedef QuizDoneCallback = void Function(QuizEvaluation evaluation);

class QuizItemWidget extends StatelessWidget {
  final QuizItem quizItem;
  final QuizWidgetScreen problemScreen;
  final QuizWidgetScreen evaluationScreen;

  QuizItemWidget(
    this.quizItem, {
    Key? key,
    required this.problemScreen,
    required this.evaluationScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return quizItem.isUnanswered ? problemScreen() : evaluationScreen();
  }
}
