import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  final String appBarTitle;

  MyAnimatedContainer({
    this.appBarTitle,
  });

  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  bool selected = false;
  Timer timer;
  final random = Random();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(milliseconds: 1500), (Timer t) => changeState());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.appBarTitle.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: AnimatedContainer(
          width: random.nextInt(400).toDouble(),
          height: random.nextInt(550).toDouble(),
          decoration: BoxDecoration(
            color: Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            ),
            borderRadius: BorderRadius.circular(
              random.nextInt(100).toDouble(),
            ),
          ),
          duration: Duration(
            milliseconds: 800,
          ),
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  void changeState() {
    setState(() {});
  }
}
