import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moya/presentation/common/my_wishlist/my_wishlist_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12, left: 16, right: 16),
      child: MyWishlistWidget(),
    );
  }
}
