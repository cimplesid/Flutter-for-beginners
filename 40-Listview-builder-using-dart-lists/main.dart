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
  //List is basically an array
  List _pets = ['Dogs', 'Cats', 'Fish', 'Turtle'];

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
                  'Pets',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                /*Listview diplay rows for different widgets,

                Listview.builder automatically builds its child widgets with a
                template and a list*/

                Expanded(
                    child: ListView.builder(
                  itemCount: _pets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(_pets.elementAt(index));
                  },
                ))
              ],
            ),
          )),
    );
  }
}
