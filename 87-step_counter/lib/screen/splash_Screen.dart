import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:step_counter/provider/step_provider.dart';
import 'package:step_counter/screen/home_screen.dart';
import 'package:step_counter/widget/loading_widget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    _navigateToHome(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Step Counter',
            style: TextStyle(
              color: Colors.black,
              fontSize: 48.0,
              letterSpacing: 2,
            ),
          ),
          Loading()
        ],
      ),
    );
  }

  void _navigateToHome(BuildContext context) async {
    await Provider.of<StepProvider>(context, listen: false).initilaize();
    Timer(
      Duration(seconds: 3),
      () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
    );
  }
}
