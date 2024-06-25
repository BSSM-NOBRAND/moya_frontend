import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friend_preview_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FriendPreviewBox extends StatelessWidget {
  final FriendPreview friendPreview;
  final void Function()? onCancelTap;

  const FriendPreviewBox({
    super.key,
    required this.friendPreview,
    required this.onCancelTap,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Skeleton.replace(
              width: 48,
              height: 48,
              child: Image.network(
                friendPreview.profileImage,
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
              friendPreview.name,
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
