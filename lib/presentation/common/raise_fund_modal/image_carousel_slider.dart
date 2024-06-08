import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/wishlist_item.dart';

class ImageCarouselSlider extends StatelessWidget {
  final List<WishlistItem> wishlist;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  const ImageCarouselSlider({
    super.key,
    required this.wishlist,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: wishlist.map((item) {
        return SizedBox(
          width: 280,
          height: 280,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  item.imageUrl,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Text(
                  item.title,
                  style: TypoTextStyle.body2(
                    // TODO : 글자 색상 바꾸기
                    color: Palette.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 280,
        onPageChanged: onPageChanged,
        enableInfiniteScroll: false,
      ),
    );
  }
}
