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
  List<BottomNavigationBarItem> _items;
  String _value = '';
  int _index = 0;

  @override
  //initState() is the default state or something which runs before the actual state or before the setState
  void initState() {
    _items = List();
    _items.add(BottomNavigationBarItem(
        icon: Icon(Icons.people), title: Text('People')));
    _items.add(BottomNavigationBarItem(
        icon: Icon(Icons.weekend), title: Text('Weekend')));
    _items.add(BottomNavigationBarItem(
        icon: Icon(Icons.message), title: Text('Message')));
  }

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
            children: <Widget>[Text(_value)],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          _index = item;
          _value = "Current value is: ${_index.toString()}";
        },
      ),
    );
  }
}
