import 'package:flutter/material.dart';
import 'package:moya/presentation/common/my_wishlist/my_wishlist.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12, left: 16, right: 16),
      child: MyWishlist(),
    );
  }
}
