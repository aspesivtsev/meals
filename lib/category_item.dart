import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/category-meals',
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      //this is border and splash on tap
      borderRadius: BorderRadius.circular(20),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: color,
                width: 0.6,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[500],
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ])),
    );
  }
}
