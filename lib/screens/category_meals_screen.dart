import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> _displayedMeals;
  String _categoryTitle;
  String _categoryId;
  var _isLoadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isLoadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _categoryTitle = routeArgs['title'];
      _categoryId = routeArgs['id'];
      _displayedMeals = widget._availableMeals
          .where((meal) => meal.categories.contains(_categoryId))
          .toList();
      setState(() {
        _isLoadedInitData = true;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: _displayedMeals[index].id,
              title: _displayedMeals[index].title,
              imageUrl: _displayedMeals[index].imageUrl,
              duration: _displayedMeals[index].duration,
              complexity: _displayedMeals[index].complexity,
              affordability: _displayedMeals[index].affordability,
            );
          },
          itemCount: _displayedMeals.length,
        ),
      ),
    );
  }
}
