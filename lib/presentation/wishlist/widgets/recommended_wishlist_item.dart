import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/recommended_wishlist_detail/recommended_wishlist_detail_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendedWishlistItem extends StatelessWidget {
  final WishlistItem wishlistItem;
  final String url;

  RecommendedWishlistItem({
    super.key,
    required this.wishlistItem,
    required this.url,
  });

  final NumberFormat numberFormatter = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecommendedWishlistDetailScreen(
              wishlistItem: wishlistItem,
              url: url,
            ),
          ),
        );
      },
      child: IntrinsicHeight(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
