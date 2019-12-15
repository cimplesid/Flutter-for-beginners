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
  MapController mapController;
  Map<String, LatLng> coords;
  List<Marker> markers;

  @override
  void initState() {
    mapController = MapController();

    coords = Map<String, LatLng>();
    coords.putIfAbsent("Chicago", () => LatLng(41.8781, -87.6298));
    coords.putIfAbsent("Detroit", () => LatLng(42.3314, -83.0458));
    coords.putIfAbsent("Lansing", () => LatLng(42.7325, -84.5555));

    markers = List<Marker>();

    for (int i = 0; i < coords.length; i++) {
      markers.add(Marker(
        width: 80.0,
        height: 80.0,
        point: coords.values.elementAt(i),
        builder: (ctx) => Icon(
          Icons.pin_drop,
          color: Colors.red,
        ),
      ));
    }
  }

  //method to move a map
  void _showCoord(int index) {
    mapController.move(coords.values.elementAt(index), 10.0);
  }

  List<Widget> _makeButtons() {
    List<Widget> list = List<Widget>();

    for (int i = 0; i < coords.length; i++) {
      list.add(RaisedButton(
        onPressed: () => _showCoord(i),
        child: Text(coords.keys.elementAt(i)),
      ));
    }
    return list;
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
            children: <Widget>[
              Row(
                children: _makeButtons(),
              ),
              Flexible(
                child: FlutterMap(
                  mapController: mapController,
                  options:
                      MapOptions(center: LatLng(41.8781, -87.6298), zoom: 10.0),
                  //openmap uses layers so we have to provide it otherwise you get errors
                  //the caching for open map is not same as google map but its good for open src projects
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayerOptions(markers: markers),
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
