import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      //this is border and splash on tap
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.red,
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
              //TextStyle(color: color),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.55), color],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            //color: color,
            //color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            //this is colored border of the button
            border: Border.all(
              color: Colors.blueGrey,
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(4, 8), // changes position of shadow
              ),
            ],
            /*[
              
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],*/
            //flatbutton shading
            /*boxShadow: [
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
              ]*/
          )),
    );
  }
}
