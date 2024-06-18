import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class FundProgressIndicator extends StatelessWidget {
  final String text;
  final bool isActive;

  const FundProgressIndicator({
    super.key,
    required this.text,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: isActive ? Palette.brandPrimary : Palette.gray200,
            ),
            borderRadius: BorderRadius.circular(12),
            color: isActive ? Palette.brandPrimaryBg : Palette.white,
          ),
          child: Text(
            text,
            style: TypoTextStyle.body1(
              color: isActive ? Palette.brandPrimary : Palette.black,
            ),
          ),
        ),
        if (isActive)
          Positioned(
            bottom: -12,
            child: SvgPicture.asset('assets/images/indicator-tail.svg'),
          )
      ],
    );
  }
}
