import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/provider/my_wishlist_provider.dart';
import 'package:moya/presentation/wishlist/widgets/recommended_wishlist_item.dart';
import 'package:provider/provider.dart';

class RecommendedWishlist extends StatefulWidget {
  const RecommendedWishlist({super.key});

  @override
  State<RecommendedWishlist> createState() => _RecommendedWishlistState();
}

class RecommendedWishlistItemEntity {
  final WishlistItem wishlistItem;
  final String url;

  const RecommendedWishlistItemEntity({
    required this.wishlistItem,
    required this.url,
  });
}

class _RecommendedWishlistState extends State<RecommendedWishlist> {
  List<RecommendedWishlistItemEntity> wishlist = [];

  Future<Iterable> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/recommended_wishlist.json');
    Iterable data = await jsonDecode(response);
    return data;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final json = await readJson();
    wishlist = json
        .map(
          (e) => RecommendedWishlistItemEntity(
            wishlistItem: WishlistItem(
              id: -1,
              imageUrl: e['imageUrl'],
              name: e['name'],
              price: int.parse(e['price']),
            ),
            url: e['url'],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.white,
        border: Border.all(
          width: 1,
          color: Palette.gray200,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<MyWishlistProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '이런 선물은 어때요?',
                  style: TypoTextStyle.h4(color: Palette.black),
                ),
                const SizedBox(height: 24),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: wishlist.length,
                  itemBuilder: (context, index) {
                    RecommendedWishlistItemEntity
                        recommendedWishlistItemEntity = wishlist[index];

                    return RecommendedWishlistItem(
                      wishlistItem: recommendedWishlistItemEntity.wishlistItem,
                      url: recommendedWishlistItemEntity.url,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
