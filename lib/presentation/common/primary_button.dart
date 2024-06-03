import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

enum ButtonSize { s56, s64 }

class PrimaryButton extends StatelessWidget {
  final ButtonSize size;
  final String text;
  final void Function()? onPressed;

  const PrimaryButton(
    this.text, {
    super.key,
    this.size = ButtonSize.s64,
    this.onPressed,
  });

  static final Map<ButtonSize, double> _heightMap = {
    ButtonSize.s56: 56,
    ButtonSize.s64: 64
  };
  static final Map<ButtonSize, TextStyle> _textStyleMap = {
    ButtonSize.s56: TypoTextStyle.body1(color: Palette.white),
    ButtonSize.s64: TypoTextStyle.h4(color: Palette.white),
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _heightMap[size],
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Palette.brandPrimary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
          overlayColor: WidgetStatePropertyAll(Palette.brandPrimaryHover),
        ),
        child: Text(
          text,
          style: _textStyleMap[size],
        ),
      ),
    );
  }
}
