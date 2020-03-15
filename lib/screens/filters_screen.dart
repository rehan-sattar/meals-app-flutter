import 'package:flutter/material.dart';

import '../models/filter.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function filterCallback;
  final FilterData currnetFilters;
  FiltersScreen(this.currnetFilters, this.filterCallback);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.currnetFilters.glutenFree;
    _isVegan = widget.currnetFilters.isVegan;
    _isVegetarian = widget.currnetFilters.vegitarian;
    _isLactoseFree = widget.currnetFilters.lactosFree;
  }

  Widget buildSwithTilesForFilters(
    String titleText,
    String subTitleText,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(titleText),
      subtitle: Text(subTitleText),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters '),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              FilterData filters = new FilterData(
                vegitarian: _isVegetarian,
                lactosFree: _isLactoseFree,
                isVegan: _isVegan,
                glutenFree: _isGlutenFree,
              );
              widget.filterCallback(filters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwithTilesForFilters(
                  'Gluten Free',
                  'Only includes gluten free food.',
                  _isGlutenFree,
                  (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                buildSwithTilesForFilters(
                  'Vegitarian',
                  'Only includes Vegitarian food.',
                  _isVegetarian,
                  (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                buildSwithTilesForFilters(
                  'Vegan',
                  'Only includes vegan food.',
                  _isVegan,
                  (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
                buildSwithTilesForFilters(
                  'Lactose Free',
                  'Only includes lactose free food.',
                  _isLactoseFree,
                  (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
