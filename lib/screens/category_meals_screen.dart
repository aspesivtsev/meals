import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = 'ass';
  Color categoryColor = Colors.pink;
  List<Meal> displayedMeals = DUMMY_MEALS;

  //late final String categoryTitle;
  //late final Color categoryColor;
  //late final List<Meal> displayedMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  //используется didChangeDependencies метод потому что в InitState'е еще не создано объекта modal route и context и в нем нет данных
  //так как объект еще не инициирован по факту
  void didChangeDependencies() {
    //here we could write Map<String, String> if all the pairs were strings
    //ModalRoute helps to pass the parameters throughout the screens
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    categoryTitle = routeArgs['title'];
    categoryColor = routeArgs['color'];
    final categoryId = routeArgs['id'];
    //looping thru all the list of DUMMY_MEALS in dummy_data.dart with filtering on category
    //displayedMeals = DUMMY_MEALS.where((meal) {return meal.categories.contains(categoryId);}).toList();
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

//this is an example of removing item from the list
/* _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }*/

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
              //this was an example of removing item from the list
              //removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
