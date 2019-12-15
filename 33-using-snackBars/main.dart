import 'package:flutter/material.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

  void _showBar() {
    _scaffoldstate.currentState
        .showSnackBar(SnackBar(content: Text('Hello World')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*a key is a way of refrencing an actual widget, below we are making refrence
      of an object we created, it will be accessible across the entire application since
      we are creating a GlobalKey*/
      key: _scaffoldstate,
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
              Text('Add widgets here'),
              RaisedButton(
                onPressed: _showBar,
                child: Text('Click me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
