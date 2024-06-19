import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friends_fund_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FriendsBirthFundItem extends StatelessWidget {
  final FriendsFundItem friendsFundItem;

  const FriendsBirthFundItem({super.key, required this.friendsFundItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Skeleton.replace(
            width: 72,
            height: 72,
            child: Image.network(friendsFundItem.imageUrl),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            children: [
              Text(
                friendsFundItem.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TypoTextStyle.body2(
                  color: Palette.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    friendsFundItem.username,
                  ),
                  Row(
                    children: [
                      Text(
                        '${(friendsFundItem.currentMoya / friendsFundItem.maxMoya * 100).floor()}%',
                      ),
                      const SizedBox(width: 12),
                      Text(
                          '${friendsFundItem.currentMoya}/${friendsFundItem.maxMoya}'),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/images/moya.svg'),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 4),
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Palette.gray200,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: friendsFundItem.currentMoya,
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: Palette.brandPrimary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Expanded(
                      flex:
                          friendsFundItem.maxMoya - friendsFundItem.currentMoya,
                      child: const SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
