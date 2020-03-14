import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final relatedCategories = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: relatedCategories[index].id,
              title: relatedCategories[index].title,
              imageUrl: relatedCategories[index].imageUrl,
              duration: relatedCategories[index].duration,
              complexity: relatedCategories[index].complexity,
              affordability: relatedCategories[index].affordability,
            );
          },
          itemCount: relatedCategories.length,
        ),
      ),
    );
  }
}
