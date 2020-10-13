import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver AppBar'),
              background: Image.network(
                "https://images.pexels.com/photos/36717/amazing-animal-beautiful-beautifull.jpg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
              child: Column(
            children: [
              Container(
                height: 150,
                color: Colors.amber,
              ),
              Container(
                height: 150,
                color: Colors.redAccent,
              ),
                Container(
                height: 150,
                color: Colors.green,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
