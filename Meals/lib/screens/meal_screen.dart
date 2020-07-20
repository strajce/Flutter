import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meal-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meal Screen'),
        ),
        body: Text('Meal Screen'));
  }
}
