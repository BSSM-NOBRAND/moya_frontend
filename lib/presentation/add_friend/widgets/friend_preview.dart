import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friend.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FriendPreview extends StatelessWidget {
  final Friend friend;
  final void Function()? onCancelTap;

  const FriendPreview(
      {super.key, required this.friend, required this.onCancelTap});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Skeleton.replace(
              width: 48,
              height: 48,
              child: Image.network(
                friend.profileImage,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 48,
                  height: 48,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              friend.name,
              style: TypoTextStyle.body2(
                color: Palette.black,
              ),
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            borderRadius: BorderRadius.circular(14),
            splashColor: Palette.gray300.withOpacity(0.3),
            highlightColor: Colors.transparent,
            onTap: onCancelTap,
            child: SvgPicture.asset('assets/images/close.svg'),
          ),
        ],
      ),
    );
  }
}
