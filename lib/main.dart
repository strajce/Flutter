import 'package:first_app/reslut.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './reslut.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionsText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Green', 'score': 0},
        {'text': 'Yellow', 'score': 1}
      ]
    },
    {
      'questionsText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 0},
        {'text': 'Cat', 'score': 1},
        {'text': 'Lion', 'score': 3},
        {'text': 'Snake', 'score': 5}
      ]
    },
    {
      'questionsText': 'What\'s your favorite city?',
      'answers': [
        {'text': 'Sombor', 'score': 1},
        {'text': 'Novi Sad', 'score': 0},
        {'text': 'Subotica', 'score': 3},
        {'text': 'Zrenjanin', 'score': 5}
      ]
    },
  ];
  var _indexOfQuestion = 0;
  var _totalScore = 0;

  void _answerOnQuestion(int score) {
    _totalScore += score;

    setState(() {
      _indexOfQuestion++;
    });
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _indexOfQuestion = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My First Flutter App"),
      ),
      body: _indexOfQuestion < _questions.length
          ? Quiz(
              questions: _questions,
              answerQuestion: _answerOnQuestion,
              indexOfQuestion: _indexOfQuestion)
          : Result(_totalScore, _restartQuiz),
    ));
  }
}
