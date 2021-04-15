import 'package:flutter/material.dart';

import '../colors.dart';
import '../odd_even_quiz_item.dart';
import '../tiny_app_widgets.dart';

class ProblemScreen extends StatelessWidget {
  final OddEvenQuizItem item;

  ProblemScreen(this.item) : super() {
    if (item.isAnswered) {
      throw StateError('Quiz item must be unanswered for ProblemScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tiny = TinyAppWidgets(theme: theme);

    return Container(
      color: theme.backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.number.toString(),
              key: Key('numberSubject'),
              style: theme.textTheme.bodyText1!.copyWith(
                fontSize: 160.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                tiny.sizedButton(
                  'Odd',
                  fontSize: 32.0,
                  color: kBlue,
                  onPressed: () => item.answer(OddAnswer()),
                ),
                SizedBox(
                  width: 100.0,
                ),
                tiny.sizedButton(
                  'Even',
                  fontSize: 32.0,
                  color: kGreen,
                  onPressed: () => item.answer(EvenAnswer()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
