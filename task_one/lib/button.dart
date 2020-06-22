import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function _clickOnButton;

  Button(this._clickOnButton);
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Button'),
      onPressed: _clickOnButton,
    );
  }
}
