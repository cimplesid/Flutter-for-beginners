//Create Counter Class

import 'package:flutter/foundation.dart';


//create counter class and increment method

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}
