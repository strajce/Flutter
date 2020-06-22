import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectedAnswer;
  final String answerText;

  Answer(this.selectedAnswer, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: RaisedButton(
        child: Text(answerText),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: selectedAnswer,
      ),
    );
  }
}
