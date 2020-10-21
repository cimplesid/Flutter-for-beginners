import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_counter/provider/step_provider.dart';
import 'package:step_counter/screen/splash_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StepProvider(),
      child: MaterialApp(
        title: 'Step Counter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
