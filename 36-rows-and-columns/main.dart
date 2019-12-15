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
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text('Please Login'),
              Row(
                children: <Widget>[
                  Text('Username'),
                  /*this will give an error because TextField is infinite, you can type
                  and type, it doesn't know where to stop and confuse Flutter but our
                  screen width is limited o to solve this we use 'Expanded' widget

                  controller is like an Android Cursor and we use it with TextField*/
                  //   TextField(controller: _user,)

                  Expanded(
                      child: TextField(
                    controller: _user,
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Password'),
                  //obscureText changes text to dots for password fields
                  Expanded(
                      child: TextField(
                    controller: _pass,
                    obscureText: true,
                  ))
                ],
              ),
              Padding(
                padding: EdgeInsets.all(32.0),
                //onPressed will show login with the username typed on terminal
                child: RaisedButton(
                  onPressed: () => print('Login ${_user.text}'),
                  child: Text('Click me'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
