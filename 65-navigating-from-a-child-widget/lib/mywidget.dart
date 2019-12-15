import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text('Click to navigate'),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/Home');
            },
            child: Text('Click me'),
          ),
        ],
      ),
    );
  }
}
