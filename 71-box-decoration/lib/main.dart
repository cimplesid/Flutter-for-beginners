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
                Text('Sun Shine'),
                Container(
                  child: Image(image: AssetImage('images/smile.png')),
                  padding: EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2.0),
                      gradient: RadialGradient(
                          colors: <Color>[Colors.red, Colors.yellow])),
                )
              ],
            ),
          )),
    );
  }
}
