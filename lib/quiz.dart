import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int indexOfQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.indexOfQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[indexOfQuestion]['questionsText']),
        ...(questions[indexOfQuestion]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
