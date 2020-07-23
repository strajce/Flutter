import 'package:flutter/material.dart';

import '../items/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> _availableMeals;
  // final String categoryId;
  // final String categoryTitle;
  // final Color bgColor;

  // CategoriesMealsScreen(this.categoryId, this.categoryTitle, this.bgColor);

  CategoriesMealsScreen(this._availableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  List<Meal> categoryMeals;
  String categoryTitle;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArg['title'];
    final String categoryId = routeArg['id'];
    categoryMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              ingredients: categoryMeals[index].ingredients,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
