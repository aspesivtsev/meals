import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx)
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.4),
                  color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
