import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/my_sponsor.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MySponsorHistoryItem extends StatelessWidget {
  MySponsor mySponsor;
  MySponsorHistoryItem({super.key, required this.mySponsor});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Skeleton.replace(
              width: 72,
              height: 72,
              child: Image.network(mySponsor.imageUrl),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mySponsor.productName,
                  style: TypoTextStyle.body2(
                    color: Palette.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mySponsor.name,
                      style: TypoTextStyle.body2(
                        color: Palette.gray600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          mySponsor.moyaAmount.toString(),
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
