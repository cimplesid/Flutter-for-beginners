import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyStatelessWidget()));
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold provide functionality of appbar, body of app etc
    return Scaffold(
        appBar: AppBar(title: Text("Stateless Widget")),
        body: Container(
            //adding padding around card
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  MyCard(
                      title: Text("I love Flutter",
                          style: TextStyle(fontSize: 20.0)),
                      icon: Icon(Icons.favorite,
                          size: 40.0, color: Colors.redAccent)),
                  MyCard(
                      title: Text("I love Donuts",
                          style: TextStyle(fontSize: 20.0)),
                      icon: Icon(Icons.donut_large,
                          size: 40.0, color: Colors.brown)),
                  MyCard(
                      title:
                          Text("I see you", style: TextStyle(fontSize: 20.0)),
                      icon: Icon(Icons.visibility,
                          size: 40.0, color: Colors.blue))
                ])));
  }
}

class MyCard extends StatelessWidget {
  //adding constructor
  MyCard({this.title, this.icon});

  final Widget title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      //adding bottom padding on card
      padding: EdgeInsets.only(bottom: 20.0),
      child: Card(
        child: Container(
          //adding padding inside card
          padding: EdgeInsets.all(15.0),
          child: Column(children: <Widget>[this.title, this.icon]),
        ),
      ),
    );
  }
}
