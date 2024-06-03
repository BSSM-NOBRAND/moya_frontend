import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/presentation/common/custom_bottom_navigation_bar.dart';
import 'package:moya/presentation/common/header.dart';
import 'package:moya/presentation/friends/friends_screen.dart';
import 'package:moya/presentation/home/home_screen.dart';
import 'package:moya/presentation/profile/profile_screen.dart';
import 'package:moya/presentation/wishlist/wishlist_screen.dart';

class BaseNavigation extends StatefulWidget {
  const BaseNavigation({super.key});

  @override
  State<BaseNavigation> createState() => _BaseNavigationState();
}

class _BaseNavigationState extends State<BaseNavigation> {
  int _page_index = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const WishlistScreen(),
    const FriendsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Palette.gray50),
          child: SafeArea(
            child: Column(
              children: [
                const Header(),
                _screens[_page_index],
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onTabChange: (index) {
            setState(() {
              if (_screens.length > index) {
                _page_index = index;
              }
            });
          },
        ),
      ),
    );
  }
}
