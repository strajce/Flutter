import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // final Color bgColor;

  // CategoriesMealsScreen(this.categoryId, this.categoryTitle, this.bgColor);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArg['title'];
    final String categoryId = routeArg['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        child: Center(
          child: Text("Meals screen Widget"),
        ),
      ),
    );
  }
}
