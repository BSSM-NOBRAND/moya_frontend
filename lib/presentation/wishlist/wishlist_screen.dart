import 'package:flutter/material.dart';
import 'package:moya/presentation/common/my_wishlist/my_wishlist.dart';
import 'package:moya/presentation/wishlist/widgets/recommended_wishlist.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 12,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      child: Column(
        children: [
          MyWishlist(),
          SizedBox(height: 12),
          RecommendedWishlist(),
        ],
      ),
    );
  }
}
