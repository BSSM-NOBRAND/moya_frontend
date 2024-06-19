import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class MyBirthFundProgress extends StatelessWidget {
  final int currentMoya;
  final int maxMoya;

  const MyBirthFundProgress({
    super.key,
    required this.currentMoya,
    required this.maxMoya,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "달성률",
              style: TypoTextStyle.h4(
                color: Palette.black,
              ),
            ),
            const Spacer(),
            Text(
              "${(currentMoya / maxMoya * 100).floor()}%",
              style: TypoTextStyle.h5(
                color: Palette.gray500,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              "$currentMoya/$maxMoya",
              style: TypoTextStyle.h4(
                color: Palette.black,
              ),
            ),
            const SizedBox(width: 6),
            SvgPicture.asset('assets/images/moya.svg'),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: Palette.gray200,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Expanded(
                flex: currentMoya,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Palette.brandPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Expanded(
                flex: maxMoya - currentMoya,
                child: const SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
