import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class Area {
  int index;
  String name;
  Color color;
  Area({this.index: -1, this.name: 'Area', this.color: Colors.lightBlueAccent});
}

class _State extends State<MyApp> {
  int _location;
  List<Area> _areas;

  @override
  void initState() {
    _areas = List<Area>();
    for (int i = 0; i < 16; i++) {
      _areas.add(Area(index: i, name: 'Area ${i}'));
    }

    var rng = Random();
    _location = rng.nextInt(_areas.length);
  }

  Widget _generate(int index) {
    //GridTile is individual square that will go to gridview
    return GridTile(
        child: Container(
      padding: EdgeInsets.all(5.0),
      child: RaisedButton(
        onPressed: () => _onPressed(index),
        color: _areas[index].color,
        child: Text(_areas[index].name, textAlign: TextAlign.center),
      ),
    ));
  }

  void _onPressed(int index) {
    setState(() {
      if (index == _location) {
        // if index==random location we found the treasure
        _areas[index].color = Colors.green;
        //You won
      } else {
        _areas[index].color = Colors.red;
      }
    });
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
              child: GridView.count(
            crossAxisCount: 4, //no of tiles you want to show in a row
            children: List<Widget>.generate(16, _generate),
          ))),
    );
  }
}
