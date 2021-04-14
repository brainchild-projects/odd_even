import 'package:flutter/foundation.dart';

enum OddEvenQuizItemAnswer {
  none,
  odd,
  even,
}

const Map<OddEvenQuizItemAnswer, String> _answerToText = {
  OddEvenQuizItemAnswer.none: 'none',
  OddEvenQuizItemAnswer.odd: 'odd',
  OddEvenQuizItemAnswer.even: 'even',
};

class OddEvenQuizItem with ChangeNotifier {
  final int number;
  bool _answered = false;
  bool _correct = false;
  OddEvenQuizItemAnswer _answer = OddEvenQuizItemAnswer.none;

  OddEvenQuizItemAnswer get answer => _answer;
  bool get isAnswered => _answered;
  bool get isUnanswered => !_answered;
  bool get isCorrect => _correct;
  String get answerText {
    return _answerToText[_answer]!;
  }

  OddEvenQuizItem(this.number);

  void _answerCorrectly(bool correct, OddEvenQuizItemAnswer answer) {
    _answered = true;
    _correct = correct;
    _answer = answer;
    notifyListeners();
  }

  void answerOdd() {
    if (isUnanswered) {
      _answerCorrectly(number % 2 != 0, OddEvenQuizItemAnswer.odd);
    }
  }

  void answerEven() {
    if (isUnanswered) {
      _answerCorrectly(number % 2 == 0, OddEvenQuizItemAnswer.even);
    }
  }
}
