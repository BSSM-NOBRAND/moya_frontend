import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/common/primary_button.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({super.key});

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.white,
        border: Border.all(
          width: 1,
          color: Palette.gray200,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '내 위시리스트',
                      style: TypoTextStyle.h4(color: Palette.black),
                    ),
                    const Spacer(),
                    InkWell(
                      child: SvgPicture.asset('assets/images/add.svg'),
                    )
                  ],
                ),
                const SizedBox(height: 36),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/empty-gift.png',
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        Text(
                          '위시리스트가 비었어요',
                          style: TypoTextStyle.h4(color: Palette.black),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '받고 싶은 선물을 고르고\n모야를 시작해보세요!',
                          style: TypoTextStyle.body2(color: Palette.gray500),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 40),
            const PrimaryButton('받고 싶은 선물 고르기', size: ButtonSize.s56),
          ],
        ),
      ),
    );
  }
}
