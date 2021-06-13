import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;

  const FavoritesScreen({Key key, @required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: MealItem(
              meal: favoriteMeals[index],
            ),
          );
        },
      );
    }
  }
}
