import 'package:flutter/material.dart';

class TypoTextStyle {
  TypoTextStyle._();

  static TextStyle h1({Color? color}) {
    return TextStyle(
      fontSize: 32,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: color,
    );
  }

  static TextStyle h2({Color? color}) {
    return TextStyle(
      fontSize: 28,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: color,
    );
  }

  static TextStyle h3({Color? color}) {
    return TextStyle(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: color,
    );
  }

  static TextStyle h4({Color? color}) {
    return TextStyle(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1.4,
      color: color,
      fontFeatures: const [FontFeature('ss05')],
    );
  }

  static TextStyle h5({Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: color,
    );
  }

  static TextStyle body1({Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: color,
    );
  }

  static TextStyle body2({Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: color,
      fontFeatures: const [FontFeature('ss05')],
    );
  }

  static TextStyle body3({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: color,
    );
  }

  static TextStyle p1({Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: color,
    );
  }

  static TextStyle p2({Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: color,
    );
  }

  static TextStyle p3({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: color,
    );
  }
}
