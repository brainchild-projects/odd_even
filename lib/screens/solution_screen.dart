import 'package:flutter/material.dart';

import '../odd_even_quiz_item.dart';

class SolutionScreen extends StatelessWidget {
  final OddEvenQuizItem item;

  SolutionScreen(this.item) : super() {
    if (item.isUnanswered) {
      throw StateError('Quiz item must already be answered for SolutionScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.isCorrect
                  ? 'Yup. ${item.number} is ${item.answerText}.'
                  : 'Nope. ${item.number} is not ${item.answerText}.',
              style: theme.textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
