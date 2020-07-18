import 'package:flutter/material.dart';

import './button.dart';
import './textresult.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isButtonClicked = false;

  void _clickOnButton() {
    setState(() {
      isButtonClicked = !isButtonClicked;
    });
  }

  String get _clickResult {
    if (isButtonClicked) {
      return "Click on Button";
    } else {
      return "Click on button next";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Task one'),
          ),
          body: Column(children: [
            TextResult(_clickResult),
            Button(_clickOnButton),
          ])),
    );
  }
}
