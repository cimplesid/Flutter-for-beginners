import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  State createState() => LoaderState();
}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    //vsync make sure that no unecessary resource are used by our device
    controller =
        AnimationController(duration: Duration(microseconds: 800), vsync: this);
    //curve is used to define how our animation behaves
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation.addListener(() {
      //we call setState everytime when the animation value changes
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {});
    /*to start the animation we use this but it shows animation
    only once i.e you have to restart app again n again*/

    //controller.forward(); /

    //use controller.repeat() to repeat your animation
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 100.0, //animation.value ranges from 0 to 1
        ),
        Padding(padding: EdgeInsets.only(bottom: 5.0)),
        Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 75.0, //animation.value ranges from 0 to 1
        ),
        Padding(padding: EdgeInsets.only(bottom: 5.0)),
        Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 50.0, //animation.value ranges from 0 to 1
        ),
      ],
    );
  }
}
