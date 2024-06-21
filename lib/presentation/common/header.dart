import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

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
                    Consumer<MyInfoProvider>(
                      builder: (context, provider, child) {
                        return Text(
                          provider.myMoya.toString(),
                          style: TypoTextStyle.h5(color: Palette.black),
                        );
                      },
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
