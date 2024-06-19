import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class AddFriendHeader extends StatelessWidget {
  const AddFriendHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(14),
            splashColor: Palette.gray300.withOpacity(0.3),
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset('assets/images/close.svg'),
          ),
          Text(
            '친구 추가',
            style: TypoTextStyle.h5(
              color: Palette.black,
            ),
          ),
          SvgPicture.asset(
            'assets/images/close.svg',
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
