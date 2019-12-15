import 'package:flutter/material.dart';
import 'second.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _name;

  @override
  void initState() {
    _name = TextEditingController();
  }

  void _onPressed() {
    // Navigator.of(context).pushNamed('/Second');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Second(_name.text),
        ));
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
                TextField(
                  controller: _name,
                  decoration: InputDecoration(labelText: 'Enter your name'),
                ),
                RaisedButton(
                  onPressed: _onPressed,
                  child: Text('Next'),
                )
              ],
            ),
          )),
    );
  }
}
