import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class SandyShores extends StatelessWidget {
  static String routeName = "sandyShores";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("You've landed on the Sandy Shores!"),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      SandyShores.routeName: (BuildContext context) => SandyShores(),
    };

    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Homepage'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var headerText = Text('Headers');

    var header = DrawerHeader(child: headerText);

    var item1Text = Text('Sandy Shores');

    var item1Icon = Icon(Icons.settings);

    var item1 =
        ListTile(title: item1Text, leading: item1Icon, onTap: _onItem1OnTap);

    var children = [header, item1];

    var listView = ListView(children: children);

    var drawer = Drawer(child: listView);

    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        title: Text('Tabs Demo'),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }

  void _onItem1OnTap() {
    Navigator.popAndPushNamed(context, SandyShores.routeName);
  }
}
