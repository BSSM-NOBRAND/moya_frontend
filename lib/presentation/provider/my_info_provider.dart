import 'package:flutter/material.dart';

class MyInfoProvider with ChangeNotifier {
  final int _myMoya = 12;

  get myMoya => _myMoya;
}
