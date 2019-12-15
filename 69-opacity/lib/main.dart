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
  bool _visible;

  @override
  void initState() {
    _visible = true;
  }

  void _toggleVisible() {
    setState(() {
      _visible = !_visible;
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
        child: Column(
          children: <Widget>[
            Opacity(
                opacity: _visible
                    ? 1.0
                    : 0.2, //changes opacity based on _toggleVisible()
                child: Text('Now you see me now you don\'t!')),
            RaisedButton(
              onPressed: _toggleVisible,
              child: Text('Toggle'),
            )
          ],
        ),
      ),
    );
  }
}
