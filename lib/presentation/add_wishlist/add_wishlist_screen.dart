import 'package:flutter/material.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/add_wishlist/widgets/add_wishlist_form.dart';
import 'package:moya/presentation/common/detail_header.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/provider/my_wishlist_provider.dart';
import 'package:provider/provider.dart';

class AddWishlistScreen extends StatefulWidget {
  const AddWishlistScreen({super.key});

  @override
  State<AddWishlistScreen> createState() => _AddWishlistScreenState();
}

class _AddWishlistScreenState extends State<AddWishlistScreen> {
  WishlistItem? wishlistItem;

  void findItem(String link) {
    setState(() {
      if (link.isEmpty) {
        wishlistItem = null;
        return;
      }
      wishlistItem = const WishlistItem(
        id: 1,
        imageUrl:
            'https://thumbnail8.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/b6b2/a2351221ee02e1500d9d87df0958a04040c81af5c516b045cde6a4bb4365.jpg',
        title:
            '호스티스 트윙키 크리미 골든 스폰지 케이크 10개입 HOSTESS TWINKIES Creamy Golden Sponge Cake 10ct',
        price: 8290,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DetailHeader(title: '위시리스트 추가'),
            AddWishlistForm(
              findItem: findItem,
              wishlistItem: wishlistItem,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 8,
          left: 16,
          right: 16,
        ),
        child: PrimaryButton(
          '추가하기',
          onPressed: () {
            if (wishlistItem != null) {
              MyWishlistProvider myWishlistProvider =
                  Provider.of<MyWishlistProvider>(context, listen: false);
              myWishlistProvider.addWishlistItem(
                imageUrl: wishlistItem!.imageUrl,
                title: wishlistItem!.title,
                price: wishlistItem!.price,
              );
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
