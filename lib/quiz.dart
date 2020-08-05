import 'package:flutter/material.dart';
import './answer.dart';
import './questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionindex;
  final Function answerQuestion;

  Quiz(
      {@required this.answerQuestion,
      @required this.questionindex,
      @required this.questions});
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Questions(
          questions[questionindex]['questionText'],
        ),
        ...(questions[questionindex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    ));
  }
}
