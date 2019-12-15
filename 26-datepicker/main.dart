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
  String _value = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2019));
    if (picked != null) setState(() => _value = picked.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
      ),
      //hit Ctrl+space in  vscode to know what are the options you can use in flutter widgets
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),
              RaisedButton(
                onPressed: _selectDate,
                child: Text('Click me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
