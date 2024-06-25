import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistItemPreview extends StatelessWidget {
  final WishlistItem wishListItem;
  final void Function()? onCancelTap;
  final NumberFormat numberFormatter = NumberFormat('#,###');

  WishlistItemPreview({
    super.key,
    this.onCancelTap,
    required this.wishListItem,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Skeleton.replace(
              width: 72,
              height: 72,
              child: Image.network(
                wishListItem.imageUrl,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 72,
                  height: 72,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        wishListItem.name,
                        style: TypoTextStyle.body2(color: Palette.black),
                      ),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      borderRadius: BorderRadius.circular(14),
                      splashColor: Palette.gray300.withOpacity(0.3),
                      highlightColor: Colors.transparent,
                      onTap: onCancelTap,
                      child: SvgPicture.asset('assets/images/close.svg'),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '₩${numberFormatter.format(wishListItem.price)}',
                    style: TypoTextStyle.body2(
                      color: Palette.black,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
