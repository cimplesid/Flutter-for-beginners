import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/second.dart';
import './screens/third.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
        //All available pages
        '/Home': (BuildContext contrext) => Home(),
        '/Second': (BuildContext contrext) => Second(),
        '/Third': (BuildContext contrext) => Third(),
      },
      home: Home(), //first page displayed
    );
  }
}
