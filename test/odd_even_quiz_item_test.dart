import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:odd_even/odd_even_quiz_item.dart';
import 'package:odd_even/quiz_item.dart';

void main() {
  group(OddEvenQuizItem, () {
    late OddEvenQuizItem item;

    group('defaults', () {
      for (final number in [1, 2]) {
        group('for ${number % 2 == 0 ? 'even' : 'odd'} number', () {
          setUp(() {
            item = OddEvenQuizItem(number);
          });

          test('is unanswered by default', () {
            expect(item.isUnanswered, true);
          });

          test('is not answered by default', () {
            expect(item.isAnswered, false);
          });

          test('is not correct by default', () {
            expect(item.isCorrect, false);
          });

          test('is unanswered by default', () {
            expect(item.isUnanswered, true);
          });
        });
      }
    });

    final _testData = {
      0: 'even',
      1: 'odd',
      2: 'even',
      3: 'odd',
      4: 'even',
      30001: 'odd',
      -1: 'odd',
      -2: 'even',
    };

    _testData.forEach((number, answer) {
      group('if given the number $number', () {
        late QuizEvaluation result;
        setUp(() {
          item = OddEvenQuizItem(number);
        });

        if (answer == 'odd') {
          group('as an odd number', () {
            group('when answered with odd', () {
              setUp(() => result = item.answer(OddAnswer()));

              test('it is correct', () {
                expect(item.isCorrect, true);
              });

              test('it becomes answered', () {
                expect(item.isAnswered, true);
              });

              test('evaluation is correct', () {
                expect(result.isCorrect, true);
              });

              test('it answers odd text', () {
                expect(result.answer.text, 'odd');
              });
            });

            group('when answered with even', () {
              setUp(() => result = item.answer(EvenAnswer()));

              test('it is not correct', () {
                expect(item.isCorrect, false);
              });

              test('it becomes answered', () {
                expect(item.isAnswered, true);
              });

              test('evaluation is not correct', () {
                expect(result.isCorrect, false);
              });

              test('it answers even text', () {
                expect(result.answer.text, 'even');
              });
            });
          });
        } else {
          group('as an even number', () {
            group('when answered with even', () {
              setUp(() => result = item.answer(EvenAnswer()));

              test('it is correct', () {
                expect(item.isCorrect, true);
              });

              test('it becomes answered', () {
                expect(item.isAnswered, true);
              });

              test('evaluation is correct', () {
                expect(result.isCorrect, true);
              });

              test('it answers odd text', () {
                expect(result.answer.text, 'even');
              });
            });

            group('when answered with odd', () {
              setUp(() => result = item.answer(OddAnswer()));

              test('it is not correct', () {
                expect(item.isCorrect, false);
              });

              test('it becomes answered', () {
                expect(item.isAnswered, true);
              });

              test('evaluation is not correct', () {
                expect(result.isCorrect, false);
              });

              test('it answers even text', () {
                expect(result.answer.text, 'odd');
              });
            });
          });
        }
      });
    });

    test('it will not override answer if answering again', () {
      item = OddEvenQuizItem(1);
      item.answer(OddAnswer());
      item.answer(EvenAnswer());
      expect(item.isAnswered, true);
      expect(item.isCorrect, true);

      item = OddEvenQuizItem(3);
      item.answer(EvenAnswer());
      item.answer(OddAnswer());
      expect(item.isAnswered, true);
      expect(item.isCorrect, false);
    });

    test('answering notifies listeners', () async {
      item = OddEvenQuizItem(1);
      final completer = Completer<bool>();
      item.addListener(() {
        completer.complete(true);
      });
      Future.delayed(
        Duration(milliseconds: 10),
        () => completer.complete(false),
      );
      item.answer(OddAnswer());
      expect(await completer.future, true);
    });
  });
}
