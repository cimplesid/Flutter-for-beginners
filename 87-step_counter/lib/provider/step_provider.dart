import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepProvider with ChangeNotifier {
  SharedPreferences sharedPreferences;
  Stream<StepCount> _stepCountStream = Pedometer.stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream =
      Pedometer.pedestrianStatusStream;
  String _status = 'Standing';
  String _steps = '0';
  DateTime _now = DateTime.now();
  String _today;
  String _yesterday;
  String _twodayAgo;
  int _lastDayStep;
  int _lastDayTotalStep;
  int _todayStep;
  int _todayTotalStep;

  //initializing the pedomete streams and other required variables
  initilaize() async {
    print('initialization start');
    sharedPreferences = await SharedPreferences.getInstance();

    _today = DateTime(_now.day, _now.month, _now.year).toString();
    _yesterday = DateTime(_now.day - 1, _now.month, _now.year).toString();
    _twodayAgo = DateTime(_now.day - 2, _now.month, _now.year).toString();

    _lastDayTotalStep = sharedPreferences.getInt(_yesterday + 'Steps') ?? 0;

    _todayTotalStep = sharedPreferences.getInt(_today + 'Steps') ?? 0;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    //deleteing 2 days old data
    if (sharedPreferences.containsKey(_twodayAgo)) {
      sharedPreferences.remove(_twodayAgo);
      sharedPreferences.remove(_twodayAgo + 'Steps');
    }
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');

    _steps = 'Cannot count steps at the moment.';
    notifyListeners();
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');

    _status = 'Cannot get status.';
    notifyListeners();
  }

  //Triggers when user stops waliking and stand still
  void onStepCount(StepCount event) async {
    var tmp = 0;
    _todayStep = sharedPreferences.getInt(_today) ?? 0;
    _lastDayStep = sharedPreferences.getInt(_yesterday) ?? 0;

    print('steps : $event');
    if (_todayStep == 0 && _lastDayStep == 0) {
      tmp = event.steps - 10;
    }

    _steps = (event.steps - _todayStep - tmp).toString();
    _todayTotalStep = _todayTotalStep + int.parse(_steps);
    notifyListeners();
    sharedPreferences.setInt(_today, event.steps);
    sharedPreferences.setInt(_today + 'Steps', _todayTotalStep);
  }

  //Triggers when user/device moves
  void onPedestrianStatusChanged(PedestrianStatus event) async {
    print(event);
    _status = event.status;
    notifyListeners();
  }

  String get pedestrianStatus => _status;
  String get pedestrianStepCount => _steps;
  int get yesterdayStep => _lastDayTotalStep;
  int get todydayStep => _todayTotalStep;
}
