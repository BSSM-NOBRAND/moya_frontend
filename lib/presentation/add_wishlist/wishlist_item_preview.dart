import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistItemPreview extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;
  final void Function()? onCancelTap;
  final NumberFormat numberFormatter = NumberFormat('#,###');

  WishlistItemPreview({
    super.key,
    this.onCancelTap,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    print(imageUrl);

    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Skeleton.replace(
              width: 72,
              height: 72,
              child: Image.network(
                imageUrl,
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
                        title,
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
                    '₩${numberFormatter.format(price)}',
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
