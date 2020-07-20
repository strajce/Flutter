import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void _openSelectedMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _openSelectedMeal,
        borderRadius: BorderRadius.circular(15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                      width: 300,
                      color: Colors.black12,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      )),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '$duration min',
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        complexityText,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.euro_symbol),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        affordabilityText,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
