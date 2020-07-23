import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  final String title;

  MainDrawer(this.title);

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Settings', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
        }),
      ],
    );
  }
}
