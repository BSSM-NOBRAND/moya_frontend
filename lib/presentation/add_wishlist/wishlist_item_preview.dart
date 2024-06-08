import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistItemPreview extends StatelessWidget {
  const WishlistItemPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Skeleton.replace(
              width: 72,
              height: 72,
              child: Image.network(
                'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/3bd6/012fa974b9fe0ccea7ca3db1ead1fdbab000c48883d232dc4c47fb319aaa.jpg',
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        '[맨시티 공식 굿즈] 스너지 엘링 필 포든 미니미 돌 쿠션 굿즈 인형',
                        style: TypoTextStyle.body2(color: Palette.black),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SvgPicture.asset('assets/images/close.svg')
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '₩56,000',
                    style: TypoTextStyle.body2(
                      color: Palette.black,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
