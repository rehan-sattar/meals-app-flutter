import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget buildListTile(IconData icon, String text, Function onTap) {
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking up!!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.pushNamed(context, '/');
          }),
          buildListTile(Icons.settings, 'Settings', () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
