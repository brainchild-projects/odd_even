import 'package:flutter/material.dart';

import 'quiz_item.dart';

typedef QuizWidgetScreen = Widget Function(
  QuizItem quizItem,
);

class QuizItemWidget extends StatefulWidget {
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
  _QuizItemWidgetState createState() => _QuizItemWidgetState(
        quizItem,
        problemScreen,
        evaluationScreen,
      );
}

class _QuizItemWidgetState extends State<QuizItemWidget> {
  final QuizItem quizItem;
  final QuizWidgetScreen problemScreen;
  final QuizWidgetScreen evaluationScreen;

  _QuizItemWidgetState(
    this.quizItem,
    this.problemScreen,
    this.evaluationScreen,
  ) : super() {
    quizItem.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return quizItem.isUnanswered
        ? problemScreen(quizItem)
        : evaluationScreen(quizItem);
  }
}
