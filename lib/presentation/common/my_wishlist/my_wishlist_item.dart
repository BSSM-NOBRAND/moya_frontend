import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyWishlistItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;
  final NumberFormat formattedNumber = NumberFormat('#,###');

  MyWishlistItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Skeleton.replace(
            width: 72,
            height: 72,
            child: Image.network(imageUrl),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TypoTextStyle.body2(color: Palette.black),
              ),
              const SizedBox(height: 9),
              Text(
                '₩${formattedNumber.format(price)}',
                style: TypoTextStyle.body2(
                  color: Palette.gray600,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
