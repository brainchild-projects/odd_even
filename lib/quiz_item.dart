import 'package:flutter/material.dart';

typedef Evaluator = QuizEvaluation Function(QuizAnswer answer);

abstract class QuizItem with ChangeNotifier {
  QuizEvaluation? evaluation;

  bool get isAnswered => evaluation is QuizEvaluation;
  bool get isUnanswered => !isAnswered;
  bool get isCorrect => isAnswered && evaluation!.isCorrect;

  QuizEvaluation answer(QuizAnswer answer) {
    if (isUnanswered) {
      evaluation = evaluate(answer);
      notifyListeners();
    }
    return evaluation!;
  }

  external QuizEvaluation evaluate(QuizAnswer answer);
}

abstract class QuizAnswer {
  Object get value;
  String get text;
}

abstract class QuizEvaluation {
  bool get isCorrect;
  QuizAnswer get answer;
}

class Correct implements QuizEvaluation {
  final QuizAnswer answer;
  final bool isCorrect = true;

  Correct(this.answer);
}

class InCorrect implements QuizEvaluation {
  final QuizAnswer answer;
  final bool isCorrect = false;

  InCorrect(this.answer);
}
