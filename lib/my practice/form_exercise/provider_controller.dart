import 'package:flutter/material.dart';

class ProviderForm extends ChangeNotifier {
  String gender = '';

  void radio(String value) {
    gender = value;
    notifyListeners();
  }
}
