import 'package:flutter/material.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/common/my_wishlist/my_wishlist_item.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/common/raise_fund_modal/raise_fund_modal.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:moya/presentation/provider/my_wishlist_provider.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Consumer<MyWishlistProvider>(
        builder: (context, provider, child) {
          List<WishlistItem> wishlist = provider.wishlist;

          return Consumer<MyInfoProvider>(
            builder: (context, myInfoProvider, child) {
              return Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: wishlist.length,
                    itemBuilder: (context, index) {
                      WishlistItem wishlistItem = wishlist[index];

                      return MyWishlistItem(
                        wishlistItem: wishlistItem,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                  ),
                  if (!myInfoProvider.user.isOpen) const SizedBox(height: 32),
                  if (!myInfoProvider.user.isOpen)
                    PrimaryButton(
                      '생일 펀드 올리기',
                      size: ButtonSize.s56,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) {
                            return RaiseFundModal(
                              wishlist: wishlist,
                            );
                          },
                        );
                      },
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
