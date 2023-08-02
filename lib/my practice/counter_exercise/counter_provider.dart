import 'package:flutter/material.dart';

class CounterIncrementProvider extends ChangeNotifier {
  int count = 0;
  int doubleCount = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void imcrementTwo() {
    doubleCount += 2;
    notifyListeners();
  }

  void decrementTwo() {
    doubleCount -= 2;
    notifyListeners();
  }
}
