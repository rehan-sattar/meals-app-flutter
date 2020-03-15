import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;
  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        "screen": CategoriesScreen(),
        "title": "Categories",
      },
      {
        "screen": FavoritesScreen(widget.favoriteMeals),
        "title": "Your Favorites",
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        onTap: _selectScreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
