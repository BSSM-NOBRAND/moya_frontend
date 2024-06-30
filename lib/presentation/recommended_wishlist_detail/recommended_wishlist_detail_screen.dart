import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/provider/my_wishlist_provider.dart';
import 'package:provider/provider.dart';

class RecommendedWishlistDetailScreen extends StatefulWidget {
  final WishlistItem wishlistItem;
  final String url;

  const RecommendedWishlistDetailScreen({
    super.key,
    required this.wishlistItem,
    required this.url,
  });

  @override
  State<RecommendedWishlistDetailScreen> createState() =>
      _RecommendedWishlistDetailScreenState();
}

class _RecommendedWishlistDetailScreenState
    extends State<RecommendedWishlistDetailScreen> {
  final NumberFormat numberFormatter = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.bottom -
                    216,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        widget.wishlistItem.imageUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 8,
                      left: 16,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        splashColor: Palette.gray300.withOpacity(0.3),
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child:
                              SvgPicture.asset('assets/images/arrow-back.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 16,
                      right: 16,
                      bottom: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.wishlistItem.name,
                              style: TypoTextStyle.h4(
                                color: Palette.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '₩${numberFormatter.format(widget.wishlistItem.price)}',
                              style:
                                  TypoTextStyle.body1(color: Palette.gray600),
                            ),
                          ],
                        ),
                        Consumer<MyWishlistProvider>(
                          builder: (context, provider, child) {
                            WishlistItem wishlistItem = widget.wishlistItem;

                            return PrimaryButton(
                              '위시리스트에 추가하기',
                              size: ButtonSize.s56,
                              onPressed: () {
                                provider.addWishlistItem(
                                  imageUrl: wishlistItem.imageUrl,
                                  url: widget.url,
                                  name: wishlistItem.name,
                                  price: wishlistItem.price,
                                );
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
