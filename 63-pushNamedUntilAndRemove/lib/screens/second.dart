import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
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
                Text('Second Page'),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Third');
                  },
                  child: Text('Next'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Home');
                  },
                  child: Text('Back'),
                )
              ],
            ),
          )),
    );
  }
}
