import 'package:flutter/material.dart';
import '../mywidget.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Second Page'),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Third');
                  },
                  child: Text('Next'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Home');
                  },
                  child: Text('Back'),
                ),
                /*
                Notice how MyWidget() also contains the route history even though it came
                from a widget.
                Doesn't matter where it is in your child hierarchy.
                It's going to use the same routing.
                Because everything extends from this widget right here my app
                everything's a part of this material app.
                */
                MyWidget(),
              ],
            ),
          )),
    );
  }
}
