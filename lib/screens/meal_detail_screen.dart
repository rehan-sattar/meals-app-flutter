import 'package:flutter/material.dart';
import '../dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function selectFavorite;
  final Function isFavorite;
  static const routeName = '/meal_detail';

  MealDetailScreen(this.selectFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildSectionContainer(Widget child) {
    return Container(
      height: 200,
      width: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildSectionContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 3,
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildSectionContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => selectFavorite(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
