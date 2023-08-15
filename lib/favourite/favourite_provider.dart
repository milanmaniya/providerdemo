import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  List<int> selectedItem = [];

  void checkValue(int index) {
    if (selectedItem.contains(index)) {
      selectedItem.remove(index);
    } else {
      selectedItem.add(index);
    }
    notifyListeners();
  }
}
