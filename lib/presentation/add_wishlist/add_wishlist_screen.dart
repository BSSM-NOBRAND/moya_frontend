import 'package:flutter/material.dart';
import 'package:moya/presentation/add_wishlist/add_wishlist_header.dart';

class AddWishlistScreen extends StatefulWidget {
  const AddWishlistScreen({super.key});

  @override
  State<AddWishlistScreen> createState() => _AddWishlistScreenState();
}

class _AddWishlistScreenState extends State<AddWishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddWishlistHeader(),
          ],
        ),
      ),
    );
  }
}
