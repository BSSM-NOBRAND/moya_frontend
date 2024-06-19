import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moya/presentation/common/my_wishlist/my_wishlist.dart';
import 'package:moya/presentation/home/widgets/my_birth_fund.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Consumer<FundStateProvider>(
        builder: (context, provider, child) {
          return provider.isFundRaised
              ? const MyBirthFund()
              : const MyWishlist();
        },
      ),
    );
  }
}
