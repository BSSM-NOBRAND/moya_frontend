import 'package:flutter/material.dart';
import 'package:moya/presentation/add_wishlist/provider/wishlist_item_preview_provider.dart';
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
  void findItem(String link) {
    WishlistItemPreviewProvider provider =
        Provider.of<WishlistItemPreviewProvider>(context, listen: false);
    provider.fetch(link);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WishlistItemPreviewProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const DetailHeader(title: '위시리스트 추가'),
                AddWishlistForm(
                  findItem: findItem,
                  wishlistItem: provider.wishlistItem,
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
                if (provider.wishlistItem != null) {
                  MyWishlistProvider myWishlistProvider =
                      Provider.of<MyWishlistProvider>(context, listen: false);
                  myWishlistProvider.addWishlistItem(
                    imageUrl: provider.wishlistItem!.imageUrl,
                    title: provider.wishlistItem!.name,
                    price: provider.wishlistItem!.price,
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
