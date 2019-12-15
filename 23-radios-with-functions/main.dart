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
  int _value1 = 0;
  int _value2 = 0;

  void _setvalue1(int value) => setState(() => _value1 = value);
  void _setvalue2(int value) => setState(() => _value2 = value);

  Widget makeRadios() {
    List<Widget> list = List<Widget>();

    for (int i = 0; i < 3; i++) {
      list.add(Radio(value: i, groupValue: _value1, onChanged: _setvalue1));
    }

    Column column = Column(
      children: list,
    );

    return column;
  }

  Widget makeRadioTiles() {
    List<Widget> list = List<Widget>();

    for (int i = 0; i < 3; i++) {
      list.add(RadioListTile(
        value: i,
        groupValue: _value2,
        onChanged: _setvalue2,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text('Item: ${i}'),
        subtitle: Text('sub title'),
      ));
    }

    Column column = Column(
      children: list,
    );
    return column;
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
            children: <Widget>[makeRadios(), makeRadioTiles()],
          ),
        ),
      ),
    );
  }
}
