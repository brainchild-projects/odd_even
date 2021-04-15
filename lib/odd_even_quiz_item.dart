import 'quiz_item.dart';

class OddEvenQuizItem extends QuizItem {
  final int number;

  OddEvenQuizItem(this.number);

  @override
  QuizEvaluation evaluate(QuizAnswer answer) {
    return number % 2 == 0
        ? _evaluate<EvenAnswer>(answer)
        : _evaluate<OddAnswer>(answer);
  }

  QuizEvaluation _evaluate<T extends OddEvenAnswer>(QuizAnswer answer) {
    return answer is T ? Correct(answer) : InCorrect(answer);
  }
}

abstract class OddEvenAnswer extends QuizAnswer {
  final String text;
  String get value => text;
  OddEvenAnswer(this.text);
}

class OddAnswer extends OddEvenAnswer {
  OddAnswer() : super('odd');
}

class EvenAnswer extends OddEvenAnswer {
  EvenAnswer() : super('even');
}
