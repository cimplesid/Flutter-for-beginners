import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
  //Map is basically a type of key/value pair in dart
  Map _countries = Map();

  void _getData() async {
    var url = 'http://country.io/names.json';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() => _countries = JSON.decode(response.body));
      print('Loaded ${_countries.length} countries');
    }
  }

  @override
  Widget build(BuildContext context) {
    //_getData();

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
                Text(
                  'Countries',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                /*Listview diplay rows for different widgets,

                Listview.builder automatically builds its child widgets with a
                template and a list*/

                Expanded(
                    child: ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = _countries.keys.elementAt(index);
                    return Row(
                      children: <Widget>[
                        Text('${key} : '),
                        Text(_countries[key])
                      ],
                    );
                  },
                ))
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    _getData();
  }
}
