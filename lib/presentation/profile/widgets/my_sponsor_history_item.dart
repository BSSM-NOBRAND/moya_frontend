import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MySponsorHistoryItem extends StatelessWidget {
  const MySponsorHistoryItem({super.key});

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
                'https://thumbnail6.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/a193/10b096aa253e617aeeb4d249001cef90bc1ed4da9d11f3a152b4acfbdd03.jpg',
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '국산 운지버섯(구름버섯) 600g 건조 건 말린 한방 차 국내산',
                  style: TypoTextStyle.body2(
                    color: Palette.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "조우성",
                      style: TypoTextStyle.body2(
                        color: Palette.gray600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '4',
                          style: TypoTextStyle.body2(
                            color: Palette.black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(
                          'assets/images/moya.svg',
                          width: 18,
                          height: 18,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
