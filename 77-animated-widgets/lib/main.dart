import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class AnimatedLogo extends AnimatedWidget {
  static final _opactityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);
  static final _rotateTween = Tween<double>(begin: 0.0, end: 12.0);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Center(
      child: Transform.rotate(
        angle: _rotateTween.evaluate(animation),
        child: Opacity(
          opacity: _opactityTween.evaluate(animation),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {
  /*
  * animation typically typically have a sequence of numbers or a list of
  * numbers that you are going to modify over time, animation itself is the
  * individual number that changes over time
  *
  * animation controller is the time at which that sequence is changed
  * */
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener(listener);
    controller.forward();
  }

  //triggering animation based on animation state
  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  Widget builder(BuildContext context, Widget child) {
    return Container(
        height: animation.value, width: animation.value, child: FlutterLogo());
  }

  // we need to dispose our controller once the animation is done otherwise it will chew up the battery and seems your app is hung up
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: AnimatedLogo(
          animation: animation,
        ),
      ),
    );
  }
}
