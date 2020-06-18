import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerOnQuestion() {
    print('Answer on Question!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My First Flutter App"),
      ),
      body: Column(children: [
        Text("First question"),
        RaisedButton(
          child: Text("Button 1"),
          onPressed: answerOnQuestion,
        ),
        RaisedButton(
          child: Text("Button 2"),
          onPressed: () => print("Answer 2 choosen!"),
        ),
        RaisedButton(
          child: Text("Button 3"),
          onPressed: () {
            //
            print('Answer 3 choosen');
          },
        ),
      ]),
    ));
  }
}
