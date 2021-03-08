import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  //final String categoryId;
  //final String categoryTitle;
  //const CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    //here we could write Map<String, String> if all the pairs were strings
    //ModalRoute helps to pass the parameters throughout the screens
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final categoryTitle = routeArgs['title'];
    final categoryColor = routeArgs['color'];
    final categoryId = routeArgs['id'];
    //looping thru all the list of DUMMY_MEALS in dummy_data.dart with filtering on category
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
          backgroundColor: categoryColor,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
