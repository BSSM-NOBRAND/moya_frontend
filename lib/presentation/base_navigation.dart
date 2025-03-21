import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/presentation/common/custom_bottom_navigation_bar.dart';
import 'package:moya/presentation/common/header.dart';
import 'package:moya/presentation/friend/friend_screen.dart';
import 'package:moya/presentation/home/home_screen.dart';
import 'package:moya/presentation/profile/profile_screen.dart';
import 'package:moya/presentation/wishlist/wishlist_screen.dart';

class BaseNavigation extends StatefulWidget {
  const BaseNavigation({super.key});

  @override
  State<BaseNavigation> createState() => _BaseNavigationState();
}

class _BaseNavigationState extends State<BaseNavigation> {
  int _pageIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const WishlistScreen(),
    const FriendsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Palette.gray50),
        child: SafeArea(
          child: Column(
            children: [
              const Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: _screens[_pageIndex],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabChange: (index) {
          setState(() {
            if (_screens.length > index) {
              _pageIndex = index;
            }
          });
        },
      ),
    );
  }
}
