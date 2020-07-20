import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        CategoriesMealsScreen.routeName: (context) => CategoriesMealsScreen(),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen()
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
