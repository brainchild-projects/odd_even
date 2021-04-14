import 'package:flutter/material.dart';
import 'package:odd_even/odd_even_quiz_item.dart';
import 'package:odd_even/screens/problem_screen.dart';
import 'package:odd_even/screens/solution_screen.dart';
import 'package:provider/provider.dart';

class OddEvenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OddEvenQuizItem>(
      builder: (context, item, _) {
        return item.isUnanswered ? ProblemScreen(item) : SolutionScreen(item);
      },
    );
  }
}
