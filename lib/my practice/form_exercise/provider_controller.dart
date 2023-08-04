import 'package:flutter/material.dart';

class ProviderForm extends ChangeNotifier {
  String gender = '';
  List<bool> checkBoxList = [false, false, false];
  List<String> hobbeyList = [];
  bool isSelectedValue = false;

  void radio(String value) {
    gender = value;
    changeState;
  }

  void check(int index, bool value, String hobbeyName) {
    checkBoxList[index] = value;
    if (value == true) {
      hobbeyList.add(hobbeyName);
    } else {
      hobbeyList.remove(hobbeyName);
    }
    changeState;
  }

  void switchValue(bool value) {
    if (value == false) {
      isSelectedValue = value;
    } else {
      isSelectedValue = false;
    }
    changeState;
  }

  void get changeState => notifyListeners();
}
