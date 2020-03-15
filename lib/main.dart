import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './models/filter.dart';
import './models/meals.dart';
import './dummy-data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FilterData _filterData = new FilterData(
    glutenFree: false,
    isVegan: false,
    lactosFree: false,
    vegitarian: false,
  );

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(FilterData newFilterData) {
    setState(() {
      _filterData = newFilterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filterData.vegitarian && !meal.isVegetarian) {
          return false;
        }
        if (_filterData.lactosFree && !meal.isLactoseFree) {
          return false;
        }
        if (_filterData.glutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (_filterData.isVegan && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(_filterData, _setFilters)
      },

      /// [onGenerateRoute] is not helpful in this case but in many casesz
      /// we want to make a redirection based on arguments of routes. In such cases
      /// it's really helpful!
      /*
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      },
      */
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => CategoryMealsScreen(_availableMeals));
      },
      // home: CategoriesScreen(),
    );
  }
}
