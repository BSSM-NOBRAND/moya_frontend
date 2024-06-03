import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int moya = 12;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      moya.toString(),
                      style: TypoTextStyle.h5(color: Palette.black),
                    ),
                    const SizedBox(width: 6),
                    SvgPicture.asset('assets/images/moya.svg')
                  ],
                ),
                const SizedBox(width: 24),
                SvgPicture.asset('assets/images/notification.svg')
              ],
            )
          ],
        ),
      ),
    );
  }
}
