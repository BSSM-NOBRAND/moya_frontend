import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moya/presentation/common/my_wishlist/my_wishlist.dart';
import 'package:moya/presentation/home/widgets/my_birth_fund.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Consumer<MyInfoProvider>(
        builder: (context, provider, child) {
          return provider.user.isOpen
              ? const MyBirthFund()
              : const MyWishlist();
        },
      ),
    );
  }
}
