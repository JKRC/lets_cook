import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lets_cook/screens/categories_meals_screen.dart';
import 'package:lets_cook/screens/categories_screen.dart';
import 'package:lets_cook/screens/meal_detail_screen.dart';
import 'package:lets_cook/screens/settings_screen.dart';
import 'package:lets_cook/screens/tabs_screen.dart';
import 'package:lets_cook/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoryMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
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
