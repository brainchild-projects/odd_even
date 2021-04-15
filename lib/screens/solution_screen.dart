import 'package:flutter/material.dart';

import '../odd_even_quiz_item.dart';
import '../quiz_item_widget.dart';
import '../tiny_app_widgets.dart';

class SolutionScreen extends StatelessWidget {
  final OddEvenQuizItem item;
  final QuizDoneCallback onDone;

  SolutionScreen(this.item, {required this.onDone}) : super() {
    if (item.isUnanswered) {
      throw StateError('Quiz item must already be answered for SolutionScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final answer = item.evaluation!.answer;
    final tiny = TinyAppWidgets(theme: theme);

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
            SizedBox(height: 40.0),
            tiny.sizedButton('Next', fontSize: 32.0, onPressed: () {
              onDone(item.evaluation!);
            }),
          ],
        ),
      ),
    );
  }

  String _oppositeOf(OddEvenAnswer answer) {
    return answer is OddAnswer ? 'even' : 'odd';
  }
}
