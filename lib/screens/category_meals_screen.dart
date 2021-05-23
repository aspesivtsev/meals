import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late Color categoryColor;
  late List<Meal> displayedMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //here we could write Map<String, String> if all the pairs were strings
    //ModalRoute helps to pass the parameters throughout the screens
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    categoryTitle = routeArgs['title'];
    categoryColor = routeArgs['color'];
    final categoryId = routeArgs['id'];
    //looping thru all the list of DUMMY_MEALS in dummy_data.dart with filtering on category
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
          backgroundColor: categoryColor,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              color: categoryColor,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
