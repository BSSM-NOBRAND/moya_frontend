import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class VisibilityOption extends StatelessWidget {
  final String text;
  final String iconPath;
  final bool isSelected;
  final void Function()? onTap;

  const VisibilityOption({
    super.key,
    required this.text,
    required this.iconPath,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: isSelected ? Palette.brandPrimaryBg : Palette.gray50,
            border: Border.all(
              width: 1,
              color: isSelected ? Palette.brandPrimary : Palette.gray200,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  isSelected ? Palette.brandPrimary : Palette.gray800,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: TypoTextStyle.body1(
                  color: isSelected ? Palette.brandPrimary : Palette.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
