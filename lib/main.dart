import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lets_cook/data/dummy_data.dart';
import 'package:lets_cook/models/meal.dart';
import 'package:lets_cook/models/settings.dart';
import 'package:lets_cook/screens/categories_meals_screen.dart';
import 'package:lets_cook/screens/categories_screen.dart';
import 'package:lets_cook/screens/meal_detail_screen.dart';
import 'package:lets_cook/screens/settings_screen.dart';
import 'package:lets_cook/screens/tabs_screen.dart';
import 'package:lets_cook/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouritesMeals = [];
  Settings settings = Settings();
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavourite(Meal meal) {
    setState(() {
      _favouritesMeals.contains(meal)
          ? _favouritesMeals.remove(meal)
          : _favouritesMeals.add(meal);
    });
  }

  bool _isFavourite(Meal meal) {
    return _favouritesMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favouritesMeals),
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoryMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) =>
            MealDetailScreen(_toggleFavourite, _isFavourite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return CategoriesScreen();
          },
        );
      },
    );
  }
}
