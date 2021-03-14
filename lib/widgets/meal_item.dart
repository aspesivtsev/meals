import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Color color;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.color});

//selecting the enum text variant
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,
        arguments: {'id': id, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ), //fit gives nice сropping to fit into the area specified
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    //color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      title,
                      style: TextStyle(
                          letterSpacing: -2,
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w100),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${complexityText}')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${affordabilityText}')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
