import 'package:flutter/material.dart';
import 'authenticator.dart';

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
  bool _isAuthenticated;

  void _onAuthenticated(bool value) {
    setState(() => _isAuthenticated = value);
  }

  @override
  void initState() {
    _isAuthenticated = false;
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
                /* onAuthenticated is a callback is a method from another class
                that you can access and call to affect some change in the originating class*/
                Authenticator(
                  onAuthenticated: _onAuthenticated,
                ),
                Text('Authenticated: ${_isAuthenticated}')
              ],
            ),
          )),
    );
  }
}
