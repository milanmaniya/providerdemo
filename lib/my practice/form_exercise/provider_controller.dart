import 'package:flutter/material.dart';

class ProviderForm extends ChangeNotifier {
  String gender = '';
  List<bool> checkBoxList = [false, false, false];
  List<String> hobbeyList = [];

  void radio(String value) {
    gender = value;
    notifyListeners();
  }

  void check(int index, bool value, String hobbeyName) {
    checkBoxList[index] = value;
    if (value == true) {
      hobbeyList.add('Cricket');
    } else {
      hobbeyList.remove('Cricket');
    }
    notifyListeners();
  }
}
