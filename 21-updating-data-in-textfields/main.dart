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

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<MyApp> {
  String _value = '';

  void _onChanged(String value) {
    setState(() => _value = 'Change: ${value}');
  }

  void _onSubmit(String value) {
    setState(() => _value = 'Submit: ${value}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
      ),
      //hit Ctrl+space in  vscode to know what are the options you can use in flutter widgets
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Hello',
                    hintText: 'Hint',
                    icon: Icon(Icons.people)),
                autocorrect: true,
                autofocus: true,

                //displaying number keyboard
                //keyboardType: TextInputType.number,

                //displaying text keyboard
                keyboardType: TextInputType.text,

                onChanged: _onChanged,
                onSubmitted: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
