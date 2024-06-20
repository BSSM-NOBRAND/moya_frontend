import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class DetailHeader extends StatelessWidget {
  final String title;

  const DetailHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(14),
              splashColor: Palette.gray300.withOpacity(0.3),
              highlightColor: Colors.transparent,
              child: SvgPicture.asset('assets/images/arrow-back.svg'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              title,
              style: TypoTextStyle.h5(color: Palette.black),
            ),
            SvgPicture.asset(
              'assets/images/arrow-back.svg',
              colorFilter: const ColorFilter.mode(
                Colors.transparent,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
