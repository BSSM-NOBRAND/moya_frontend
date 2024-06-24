import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friend.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyFriendListItem extends StatelessWidget {
  final Friend friend;
  const MyFriendListItem({
    super.key,
    required this.friend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Skeleton.replace(
                width: 48,
                height: 48,
                child: Image.network(friend.profileImage),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              friend.name,
              style: TypoTextStyle.body2(
                color: Palette.black,
              ),
            ),
          ],
        ),
        if (friend.isOpen)
          Container(
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Palette.brandPrimaryBg,
              border: Border.all(
                width: 1,
                color: Palette.brandPrimary,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "펀드 진행중",
                style: TypoTextStyle.body3(
                  color: Palette.brandPrimary,
                ),
              ),
            ),
          )
      ],
    );
  }
}
