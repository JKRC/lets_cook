import 'package:flutter/material.dart';
import 'package:lets_cook/data/dummy_data.dart';
import 'package:lets_cook/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES.map((category) {
        return CategoryItem(category);
      }).toList(),
    );
  }
}
