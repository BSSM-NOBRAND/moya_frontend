import 'package:flutter/material.dart';

class MyInfoProvider with ChangeNotifier {
  int _myMoya = 12;
  int _myMileage = 12000;

  int get myMoya => _myMoya;
  int get myMileage => _myMileage;

  void exchangeMileage() {
    _myMoya += (_myMileage / 5000).floor();
    _myMileage %= 5000;
    notifyListeners();
  }
}
