import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _score;
  final Function _resetHandler;
  String get scoreResult {
    if (_score == 0) {
      return "You are normal!!!";
    } else if (_score == 15) {
      return "You are weird!!!";
    } else {
      return "You are almost weird!";
    }
  }

  Result(this._score, this._resetHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            scoreResult,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
            ),
            textColor: Colors.blue,
            onPressed: _resetHandler,
          )
        ],
      ),
    );
  }
}
