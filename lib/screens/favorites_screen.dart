import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.length == 0
        ? Center(
            child: Text(
              'You don not any favorites yet... Try adding some!',
            ),
          )
        : Container(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  id: favoriteMeals[index].id,
                  title: favoriteMeals[index].title,
                  imageUrl: favoriteMeals[index].imageUrl,
                  duration: favoriteMeals[index].duration,
                  complexity: favoriteMeals[index].complexity,
                  affordability: favoriteMeals[index].affordability,
                );
              },
              itemCount: favoriteMeals.length,
            ),
          );
  }
}
