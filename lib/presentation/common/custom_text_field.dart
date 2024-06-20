import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      cursorColor: Palette.brandPrimary,
      style: TypoTextStyle.h3(
        color: Palette.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 0),
        hintText: hintText,
        hintStyle: TypoTextStyle.h3(
          color: Palette.gray400,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Palette.gray200,
            width: 2,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Palette.gray200,
            width: 2,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
