import 'package:flutter/material.dart';
import '../code/GlobalState.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _name;
  GlobalState _store = GlobalState.instance;

  @override
  void initState() {
    _name = TextEditingController();
    _store.set('name', '');
    _name.text = _store.get('name');
  }

  void _onPressed() {
    setState(() {
      _store.set('name', _name.text);
    });
    Navigator.of(context).pushNamed('/Second');
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
