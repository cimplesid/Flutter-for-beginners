import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  Second(this.name);
  String name;
  @override
  _SecondState createState() => _SecondState(name);
}

class _SecondState extends State<Second> {
  _SecondState(this.name);
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Hello ${name}'),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Back'),
                )
              ],
            ),
          )),
    );
  }
}
