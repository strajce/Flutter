import 'package:Meals/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details-screen';

  @override
  Widget build(BuildContext context) {
    // final routeArg =
    //     ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final routeArg = ModalRoute.of(context).settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == routeArg);
    // final mealTitle = routeArg['title'];
    // final imageUrl = routeArg['imageUrl'];
    // final List<String> ingredients = routeArg['ingredients'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealDetails.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  mealDetails.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "Ingrediens",
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey),
                  ),
                  height: 250,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 25,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      // return Card(
                      //   child: Text(
                      //     mealDetails.ingredients[index],
                      //     style: TextStyle(
                      //       fontSize: 20,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // );
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${(index + 1)}'),
                            ),
                            title: Text(
                              mealDetails.ingredients[index],
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    },
                    itemCount: mealDetails.ingredients.length,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Steps",
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 250,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 25,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      // return Card(
                      //   color: Theme.of(context).accentColor,
                      //   child: Text(
                      //     mealDetails.steps[index],
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // );
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${(index + 1)}'),
                            ),
                            title: Text(
                              mealDetails.steps[index],
                            ),
                          ),
                          Divider()
                        ],
                      );
                    },
                    itemCount: mealDetails.steps.length,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
