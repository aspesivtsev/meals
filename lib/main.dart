import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
//import './screens/categories_screen.dart';
import './screens/tab_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          scaffoldBackgroundColor: Colors.blue[50],
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                shadows: [
                  const Shadow(
                    blurRadius: 15.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                  const Shadow(
                    blurRadius: 2.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ))),

      //home: MyHomePage(),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        //the routes of the app
        //'/': (ctx) => CategoriesScreen(),
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        //if all the routes fail it will show the main screen
        return MaterialPageRoute(builder: (ctx) => TabsScreen());
      },
    );
  }
}
