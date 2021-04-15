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
    final answer = item.evaluation!.answer;

    final feedback = item.isCorrect
        ? 'Yup. ${item.number} is ${answer.text}.'
        : 'Nope. ${item.number} is ${_oppositeOf(answer as OddEvenAnswer)}.';

    return Container(
      color: theme.backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              feedback,
              style: theme.textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }

  String _oppositeOf(OddEvenAnswer answer) {
    return answer is OddAnswer ? 'even' : 'odd';
  }
}
