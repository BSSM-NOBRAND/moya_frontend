import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class LetterForm extends StatelessWidget {
  final void Function(String)? onLetterChanged;

  const LetterForm({super.key, this.onLetterChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '후원할 때 같이 남길 편지도 써줘',
            style: TypoTextStyle.h4(color: Palette.black),
          ),
          const SizedBox(height: 20),
          TextField(
            maxLines: 6,
            maxLength: 100,
            cursorColor: Palette.brandPrimary,
            style: TypoTextStyle.body2(
              color: Palette.black,
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: Palette.gray50,
              hintText: "최대 100자만큼 쓸 수 있어",
              hintStyle: TypoTextStyle.body2(
                color: Palette.gray400,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Palette.gray200,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Palette.gray200,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onChanged: onLetterChanged,
          ),
        ],
      ),
    );
  }
}
