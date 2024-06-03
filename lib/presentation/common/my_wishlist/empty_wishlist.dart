import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/common/primary_button.dart';

class EmptyWishlist extends StatefulWidget {
  const EmptyWishlist({super.key});

  @override
  State<EmptyWishlist> createState() => _EmptyWishlistState();
}

class _EmptyWishlistState extends State<EmptyWishlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 36),
      child: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 18,
                    top: 24,
                    child: Image.network(
                      'https://thumb.mt.co.kr/06/2009/05/2009052713035136194_1.jpg',
                      height: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/images/empty-gift.png',
                  ),
                ],
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
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            '받고 싶은 선물 고르기',
            size: ButtonSize.s56,
            onPressed: () {
              print('홈 응디 응디');
            },
          ),
        ],
      ),
    );
  }
}
