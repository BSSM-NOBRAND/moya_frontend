import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:moya/domain/entities/user.dart';
import 'package:moya/presentation/common/birth_fund_progress.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:provider/provider.dart';

class VerifiedCard extends StatelessWidget {
  const VerifiedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Palette.white,
        border: Border.all(
          width: 1,
          color: Palette.gray200,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Consumer<MyInfoProvider>(
        builder: (context, provider, child) {
          User user = provider.user;

          return Consumer<FundStateProvider>(
            builder: (context, provider, child) {
              Fund fund = provider.fund;

              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      fund.imageUrl,
                      width: double.infinity,
                      height: 230,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(
                        width: double.infinity,
                        height: 230,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    fund.name,
                    style: TypoTextStyle.h4(
                      color: Palette.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        user.name,
                        style: TypoTextStyle.body2(
                          color: Palette.gray700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Palette.gray700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        // TODO: 시작 날짜 넣기
                        "${fund.createdAt.replaceAll(RegExp(r"-"), ".")} ~ ${fund.finishedAt.replaceAll(RegExp(r"-"), ".")}",
                        style: TypoTextStyle.body2(
                          color: Palette.gray700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  BirthFundProgress(
                    currentMoya: fund.moya,
                    maxMoya: fund.targetMoya,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Palette.brandPrimaryBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/sparklers.png",
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "전액 모금 성공!",
                          style:
                              TypoTextStyle.body1(color: Palette.brandPrimary),
                        ),
                        const SizedBox(width: 12),
                        Image.asset(
                          "assets/images/sparklers.png",
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SvgPicture.asset(
                    'assets/images/grayscale_logo.svg',
                    height: 24,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
