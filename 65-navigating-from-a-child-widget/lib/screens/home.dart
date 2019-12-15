import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                Text('Welcome Home'),
                //pushNamedAndRemoveUntil basically removes the back button e.g in second.dart you won't see any back button
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/Second', (Route<dynamic> route) => false);
                  },
                  child: Text('Next'),
                )
              ],
            ),
          )),
    );
  }
}
