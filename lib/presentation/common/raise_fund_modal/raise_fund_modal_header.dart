import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class RaiseFundModalHeader extends StatelessWidget {
  const RaiseFundModalHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/close.svg',
              colorFilter: const ColorFilter.mode(
                Colors.transparent,
                BlendMode.srcIn,
              ),
            ),
            Text(
              '위시리스트 추가',
              style: TypoTextStyle.h5(color: Palette.black),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(14),
              splashColor: Palette.gray300.withOpacity(1),
              highlightColor: Colors.transparent,
              child: SvgPicture.asset('assets/images/close.svg'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
