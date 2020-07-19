import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../items/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: GridView(
        children: DUMMY_CATEGORIES
            .map((categoryData) => CategoryItem(
                id: categoryData.id,
                title: categoryData.title,
                bgColor: categoryData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
