import 'package:flutter/material.dart';

class ProviderForm extends ChangeNotifier {
  String gender = '';
  List<bool> checkBoxList = [false, false, false];
  List<String> hobbeyList = [];
  bool isSelectedValue = false;
  String? selectedValue;
  List<String> dropDownButtonList = ['india', 'usa', 'uk'];

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
    isSelectedValue = value;
    changeState;
  }

  void dropDownValue(String value) {
    selectedValue = value;
    changeState;
  }

  void get changeState => notifyListeners();
}
