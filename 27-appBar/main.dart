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
  int _value = 0;

  void _add() => setState(() => _value++);
  void _remove() => setState(() => _value--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _add),
          IconButton(icon: Icon(Icons.remove), onPressed: _remove)
        ],
      ),
      //hit Ctrl+space in  vscode to know what are the options you can use in flutter widgets
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                _value.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
