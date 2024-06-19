import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friends_fund_item.dart';
import 'package:moya/presentation/friends/widgets/friends_birth_fund_item.dart';

class FriendsBirthFundList extends StatelessWidget {
  final List<FriendsFundItem> friendsFundList = [
    const FriendsFundItem(
      id: 1,
      username: '조우성',
      imageUrl:
          'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/1c46/6070d09419b8197c5d4d0e7fd0bc2cafd18f47e54a80f2ca2592025512bc.jpg',
      title: '켈로그 팝타르트 프로스트 스트로베리, 384g, 1개',
      currentMoya: 12,
      maxMoya: 20,
      dDay: 6,
    ),
    const FriendsFundItem(
      id: 2,
      username: '조우성',
      imageUrl:
          'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/1c46/6070d09419b8197c5d4d0e7fd0bc2cafd18f47e54a80f2ca2592025512bc.jpg',
      title: '켈로그 팝타르트 프로스트 스트로베리, 384g, 1개',
      currentMoya: 12,
      maxMoya: 20,
      dDay: 6,
    ),
    const FriendsFundItem(
      id: 3,
      username: '조우성',
      imageUrl:
          'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/1c46/6070d09419b8197c5d4d0e7fd0bc2cafd18f47e54a80f2ca2592025512bc.jpg',
      title: '켈로그 팝타르트 프로스트 스트로베리, 384g, 1개',
      currentMoya: 12,
      maxMoya: 20,
      dDay: 6,
    )
  ];

  FriendsBirthFundList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: Palette.gray200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '친구들의 생일 펀드',
            style: TypoTextStyle.h4(
              color: Palette.black,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: friendsFundList.length,
            itemBuilder: (context, index) {
              return FriendsBirthFundItem(
                friendsFundItem: friendsFundList[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 24),
          ),
        ],
      ),
    );
  }
}
