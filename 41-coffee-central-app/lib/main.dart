import 'package:flutter/material.dart';
import 'package:coffee_central_app/screens/home.dart';
import 'package:coffee_central_app/screens/foodmenu_selected.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => Home(),
        '/FoodMenuSelected': (BuildContext context) => FoodMenuSelected(),
      },
      home: Home(),
    );
  }
}
