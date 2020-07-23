import 'package:Meals/dummy_data.dart';
import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filterStates = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filterStates = filterData;
      _availableMeals = DUMMY_MEALS.where(
        (meal) {
          if (_filterStates['gluten'] && !meal.isGlutenFree) {
            return false;
          }
          if (_filterStates['lactose'] && !meal.isLactoseFree) {
            return false;
          }
          if (_filterStates['vegan'] && !meal.isVegan) {
            return false;
          }
          if (_filterStates['vegetarian'] && !meal.isVegetarian) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color.fromRGBO(207, 219, 230, 1),
        canvasColor: Color.fromRGBO(207, 219, 230, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', //default value
      routes: {
        '/': (context) => TabsScreen(),
        CategoriesMealsScreen.routeName: (context) =>
            CategoriesMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
        SettingsScreen.routeName: (context) =>
            SettingsScreen(_filterStates, _setFilter),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
