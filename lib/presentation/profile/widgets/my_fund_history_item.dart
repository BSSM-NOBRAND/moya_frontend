import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyFundHistoryItem extends StatelessWidget {
  final Fund myFund;

  const MyFundHistoryItem({super.key, required this.myFund});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Skeleton.replace(
            width: 64,
            height: 64,
            child: Image.network(myFund.imageUrl),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myFund.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TypoTextStyle.body2(
                  color: Palette.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    myFund.finishedAt.replaceAll(RegExp("-"), "."),
                    style: TypoTextStyle.body3(
                      color: Palette.gray500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${(myFund.moya / myFund.targetMoya * 100).floor()}%',
                      ),
                      const SizedBox(width: 12),
                      Text('${myFund.moya}/${myFund.targetMoya}'),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/images/moya.svg'),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 4),
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Palette.gray200,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: myFund.moya,
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: Palette.brandPrimary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: myFund.targetMoya - myFund.moya,
                      child: const SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
