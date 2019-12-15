import 'package:flutter/material.dart';

void main() {
  runApp(   MaterialApp(
    home:    MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() =>    _State();
}

class _State extends State<MyApp> {

  int counter = 0;
  List<Widget> _list =    List<Widget>();

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _  Item(i);
      _list.add(child);
    }
  }

  void _onClicked() {
    Widget child = _  Item(counter);
    setState(() => _list.add(child));
  }

  Widget _  Item(int i)  {
    Key key =    Key('item_${i}');
    Container child =    Container(
      //key allows us to reference that object, kind of like identifier
      //we need key to access child widget tree, in this case we need container
      key: key,
      padding:    EdgeInsets.all(10.0),
      child:    Chip(
        label:    Text('${i} Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar:    CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child:    Text(i.toString()),
        ),
      ),
    );

    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for(int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if(child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar:    AppBar(
        title:    Text('Name here'),
      ),
      floatingActionButton:    FloatingActionButton(onPressed: _onClicked, child:    Icon(Icons.add),),

      body:    Container(
          padding:    EdgeInsets.all(32.0),
          child:    Center(
            child:    Column(
              children: _list,
            ),
          )
      ),
    );
  }


}
