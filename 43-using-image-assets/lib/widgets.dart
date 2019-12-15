import 'package:flutter/material.dart';

class Texty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('This works'));
  }
}

class MyExploreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = AssetImage('assets/explore.png');
    var image = Image(image: assetsImage, width: 48.0, height: 48.0);
    return Container(child: image);
  }
}
