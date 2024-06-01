import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

enum ButtonSize { s56, s64 }

class PrimaryButton extends StatelessWidget {
  final ButtonSize size;
  final String text;

  const PrimaryButton(this.text, {super.key, this.size = ButtonSize.s64});

  static Map<ButtonSize, double> heightMap = {
    ButtonSize.s56: 56,
    ButtonSize.s64: 64
  };
  static Map<ButtonSize, TextStyle> textStyleMap = {
    ButtonSize.s56: TypoTextStyle.body1(color: Palette.white),
    ButtonSize.s64: TypoTextStyle.h4(color: Palette.white),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: heightMap[size],
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: TextButton(
        onPressed: () {},
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.red),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
        ),
        child: Text(
          text,
          style: textStyleMap[size],
        ),
      ),
    );
  }
}
