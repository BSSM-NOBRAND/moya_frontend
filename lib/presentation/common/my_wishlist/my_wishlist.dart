import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/add_wishlist/add_wishlist_screen.dart';
import 'package:moya/presentation/common/my_wishlist/empty_wishlist.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({super.key});

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
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
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '내 위시리스트',
                  style: TypoTextStyle.h4(color: Palette.black),
                ),
                const Spacer(),
                Stack(
                  children: [
                    SvgPicture.asset('assets/images/add.svg'),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        splashColor: Palette.gray300.withOpacity(0.3),
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AddWishlistScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
            const EmptyWishlist(),
          ],
        ),
      ),
    );
  }
}
