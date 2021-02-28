import "package:flutter/material.dart";

class CategoryMealsScreen extends StatelessWidget {
  //final String categoryId;
  //final String categoryTitle;

  //const CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    //here we could write Map<String, String> if all the pairs were strings
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final categoryTitle = routeArgs['title'];
    //final categoryId = routeArgs['id'];
    final categoryColor = routeArgs['color'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: Center(
        child: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
