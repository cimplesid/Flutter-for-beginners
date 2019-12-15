import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<MyApp> {
  /*
  1. Create a directory called images and add your image there
  2. In pubspec.yamp add dependency for using assets
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
        backgroundColor: Colors.red,
      ),
      //hit Ctrl+space in  vscode to know what are the options you can use in flutter widgets
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Image from assets'),
              Image.asset('images/flutter.png'),
              Text('Image from network'),
              //this image was outside the screen so we are using Expanded which will fit the image into the screen
              Expanded(
                  child: Image.network(
                      'https://static.makeuseof.com/wp-content/uploads/2012/10/flutter-logo.jpg'))
            ],
          ),
        ),
      ),
    );
  }
}
