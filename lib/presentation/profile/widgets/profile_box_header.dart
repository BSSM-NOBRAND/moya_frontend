import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileBoxHeader extends StatelessWidget {
  final NumberFormat _numberFormatter = NumberFormat('#,###');

  ProfileBoxHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Skeleton.replace(
                width: 48,
                height: 48,
                child: Image.network(
                  'https://storage.surfit.io/user/avatar/1745610414.png',
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '신준서',
                  style: TypoTextStyle.h5(
                    color: Palette.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '@ddoory1103',
                  style: TypoTextStyle.body3(
                    color: Palette.gray500,
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Consumer<MyInfoProvider>(
              builder: (context, provider, child) {
                return Text(
                  _numberFormatter.format(provider.user.mileage),
                  style: TypoTextStyle.h5(
                    color: Palette.black,
                  ),
                );
              },
            ),
            const SizedBox(width: 6),
            SvgPicture.asset(
              'assets/images/mileage.svg',
              width: 20,
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}
