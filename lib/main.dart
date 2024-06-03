import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/presentation/base_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'WantedSans',
        scaffoldBackgroundColor: Palette.white,
      ),
      home: const BaseNavigation(),
    );
  }
}
