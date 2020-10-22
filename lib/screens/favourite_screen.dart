import 'package:flutter/material.dart';
import 'package:lets_cook/models/meal.dart';
import 'package:lets_cook/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  const FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text(
          'Nenhuma refeição foi marcada como favorita',
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favouriteMeals[index]);
        },
      );
    }
  }
}
