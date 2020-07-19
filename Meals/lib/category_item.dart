import 'package:flutter/material.dart';

import './screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  CategoryItem(
      {@required this.id, @required this.title, @required this.bgColor});

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (_) => CategoriesMealsScreen(id, title, bgColor),
    // ));
    Navigator.of(context).pushNamed(
      CategoriesMealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [bgColor.withOpacity(0.3), bgColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
