import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/my_wishlist_detail/my_wishlist_detail_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyWishlistItem extends StatelessWidget {
  final WishlistItem wishlistItem;
  final NumberFormat numberFormatter = NumberFormat('#,###');

  MyWishlistItem({
    super.key,
    required this.wishlistItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyWishlistDetailScreen(
              wishlistItem: wishlistItem,
            ),
          ),
        );
      },
      child: IntrinsicHeight(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Skeleton.replace(
                width: 72,
                height: 72,
                child: Image.network(wishlistItem.imageUrl),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    wishlistItem.name,
                    style: TypoTextStyle.body2(color: Palette.black),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '₩${numberFormatter.format(wishlistItem.price)}',
                      style: TypoTextStyle.body2(
                        color: Palette.gray600,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
