import 'package:Movie_rating_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(), 
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 20, 
            color: Colors.white, 
            // fontWeight: FontWeight.bold
          )
        )
      ),
    ); 
  }
}
