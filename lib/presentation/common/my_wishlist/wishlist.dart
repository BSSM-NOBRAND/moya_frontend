import 'package:flutter/material.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/common/my_wishlist/my_wishlist_item.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/common/raise_fund_modal/raise_fund_modal.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    List<WishlistItem> wishlist = <WishlistItem>[
      const WishlistItem(
        imageUrl:
            'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/1c46/6070d09419b8197c5d4d0e7fd0bc2cafd18f47e54a80f2ca2592025512bc.jpg',
        title: '[맨시티 공식 굿즈] 스너지 엘링 필 포든 미니미 돌 쿠션 굿즈 인형',
        price: 50000,
      ),
      const WishlistItem(
        imageUrl:
            'https://thumbnail10.coupangcdn.com/thumbnails/remote/492x492ex/image/retail/images/1644208474607669-5e1ffc52-6270-4c17-880a-fdde32758b92.png',
        title: '행복한댕냥이 고양이 숨숨집 하우스',
        price: 3900,
      ),
      const WishlistItem(
        imageUrl:
            'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/1c46/6070d09419b8197c5d4d0e7fd0bc2cafd18f47e54a80f2ca2592025512bc.jpg',
        title: '[맨시티 공식 굿즈] 스너지 엘링 필 포든 미니미 돌 쿠션 굿즈 인형',
        price: 119000,
      ),
    ];

    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: wishlist.length,
            itemBuilder: (context, index) {
              WishlistItem wishlistItem = wishlist[index];

              return MyWishlistItem(
                imageUrl: wishlistItem.imageUrl,
                title: wishlistItem.title,
                price: wishlistItem.price,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
          const SizedBox(height: 32),
          PrimaryButton('생일 펀드 올리기', size: ButtonSize.s56, onPressed: () {
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
          }),
        ],
      ),
    );
  }
}
