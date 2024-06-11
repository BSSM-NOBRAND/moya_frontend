import 'package:flutter/material.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/common/my_wishlist/my_wishlist_item.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/common/raise_fund_modal/raise_fund_modal.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:moya/presentation/provider/my_wishlist_provider.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  // List<WishlistItem> wishlist = <WishlistItem>[
  //   const WishlistItem(
  //     id: 1,
  //     imageUrl:
  //         'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/1c46/6070d09419b8197c5d4d0e7fd0bc2cafd18f47e54a80f2ca2592025512bc.jpg',
  //     title: '켈로그 팝타르트 프로스트 스트로베리, 384g, 1개',
  //     price: 8040,
  //   ),
  //   const WishlistItem(
  //     id: 2,
  //     imageUrl:
  //         'https://thumbnail10.coupangcdn.com/thumbnails/remote/492x492ex/image/retail/images/1644208474607669-5e1ffc52-6270-4c17-880a-fdde32758b92.png',
  //     title: '행복한댕냥이 고양이 숨숨집 하우스',
  //     price: 19800,
  //   ),
  //   const WishlistItem(
  //     id: 3,
  //     imageUrl:
  //         'https://thumbnail6.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/a193/10b096aa253e617aeeb4d249001cef90bc1ed4da9d11f3a152b4acfbdd03.jpg',
  //     title: '국산 운지버섯(구름버섯) 600g 건조 건 말린 한방 차 국내산',
  //     price: 102400,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    FundStateProvider fundStateProvider =
        Provider.of<FundStateProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Consumer<MyWishlistProvider>(
        builder: (context, provider, child) {
          List<WishlistItem> wishlist = provider.wishlist;

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
              if (!fundStateProvider.isFundRaised) const SizedBox(height: 32),
              if (!fundStateProvider.isFundRaised)
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
      ),
    );
  }
}
