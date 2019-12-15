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

class _State extends State<MyApp> {
  int _turns;
  double _value;

  @override
  void initState() {
    _turns = 0;
    _value = 0.0;
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
      _turns = value.toInt();
    });
  }

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
                Slider(
                  value: _value,
                  onChanged: _onChanged,
                  min: 0.0,
                  max: 4.0,
                ),
                RotatedBox(
                  quarterTurns: _turns,
                  child: Text('Hello World'),
                )
              ],
            ),
          )),
    );
  }
}
