import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double sliderValue = 0.0;

  void slide(double value) {
    sliderValue = value;
    stateChange;
  }

  void get stateChange => notifyListeners();
}
