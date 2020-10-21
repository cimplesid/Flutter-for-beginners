import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_counter/provider/step_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final _stepProvider = Provider.of<StepProvider>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Step Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Consumer<StepProvider>(
                builder: (context, _stepProvider, child) => Text(
                  'Yesterday\'s Steps: ${_stepProvider.yesterdayStep}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Text(
                'Today\'s Steps:',
                style: TextStyle(fontSize: 30),
              ),
              Consumer<StepProvider>(
                builder: (context, _stepProvider, child) => Text(
                  // _steps,
                  _stepProvider.todydayStep.toString(),
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Text(
                'Current Steps:',
                style: TextStyle(fontSize: 30),
              ),
              Consumer<StepProvider>(
                builder: (context, _stepProvider, child) => Text(
                  // _steps,
                  _stepProvider.pedestrianStepCount,
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Text(
                'Status:',
                style: TextStyle(fontSize: 30),
              ),
              Consumer<StepProvider>(
                builder: (context, _stepProvider, child) => Icon(
                  _stepProvider.pedestrianStatus == 'walking'
                      ? Icons.directions_walk
                      : _stepProvider.pedestrianStatus == 'stopped'
                          ? Icons.accessibility_new
                          : Icons.error,
                  size: 80,
                ),
              ),
              Center(
                child: Consumer<StepProvider>(
                  builder: (context, _stepProvider, child) => Text(
                    _stepProvider.pedestrianStatus,
                    style: _stepProvider.pedestrianStatus == 'walking' ||
                            _stepProvider.pedestrianStatus == 'stopped'
                        ? TextStyle(fontSize: 30)
                        : TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
