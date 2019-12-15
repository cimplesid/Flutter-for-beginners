import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
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
            children: <Widget>[
              Flexible(
                child: FlutterMap(
                  options:
                      MapOptions(center: LatLng(41.8781, -87.6298), zoom: 10.0),
                  //openmap uses layers so we have to provide it otherwise you get errors
                  //the caching for open map is not same as google map but its good for open src projects
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
