import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  //const MealDetailScreen({Key key}) : super(key: key);
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final _Id =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final mealId = _Id['id'];
    final mealColor = _Id['color'];

    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
        backgroundColor: mealColor,
      ),
      body: Center(
        child: Text('Meal - $mealId'),
      ),
    );
  }
}
