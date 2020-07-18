import 'package:flutter/material.dart';

class TextResult extends StatelessWidget {
  final String text;

  TextResult(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}