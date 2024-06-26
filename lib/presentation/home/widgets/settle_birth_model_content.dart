import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:moya/presentation/common/birth_fund_progress.dart';
import 'package:moya/presentation/common/my_birth_fund_image.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:provider/provider.dart';

class SettleBirthModalContent extends StatelessWidget {
  final NumberFormat numberFormatter = NumberFormat('#,###');

  SettleBirthModalContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Consumer<FundStateProvider>(
        builder: (context, provider, child) {
          Fund fund = provider.fund;

          final DateTime dDay = DateTime.parse(fund.finishedAt);
          final Duration difference = DateTime.now().difference(dDay);
          final bool targetMoyaAchieved = fund.moya == fund.targetMoya;

          return Column(
            children: [
              MyBirthFundImage(
                dDay: difference.inDays,
                title: fund.name,
                imageUrl: fund.imageUrl,
              ),
              const SizedBox(height: 16),
              BirthFundProgress(
                currentMoya: fund.moya,
                maxMoya: fund.targetMoya,
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  targetMoyaAchieved
                      ? "축하해, 목표 모야를 다 모금 받았어!\n정산하면 네가 설정한 주소로 선물이 배송될거야.\n선물 가격에서 남은 돈은 마일리지로 돌려줄게."
                      : "아쉽지만 목표 모야 만큼 모금하지 못했어ㅠ\n하지만 친구들에게 받은 모야는 \n마일리지로 다시 돌려주니까 걱정하지마!",
                  style: TypoTextStyle.body2(
                    color: Palette.gray600,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              if (targetMoyaAchieved)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 49,
                          child: Text(
                            '남은 돈',
                            style: TypoTextStyle.body3(
                              color: Palette.gray700,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 12,
                            bottom: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Palette.gray100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '₩${numberFormatter.format(5000 - fund.price % 5000)}',
                            style: TypoTextStyle.body1(
                              color: Palette.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    SvgPicture.asset('assets/images/arrow-right.svg'),
                    const SizedBox(width: 20),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 49,
                          child: Text(
                            '마일리지',
                            style: TypoTextStyle.body3(
                              color: Palette.gray700,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 12,
                            bottom: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Palette.gray100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Text(
                                (5000 - fund.price % 5000).ceil().toString(),
                                style: TypoTextStyle.body1(
                                  color: Palette.black,
                                ),
                              ),
                              const SizedBox(width: 6),
                              SvgPicture.asset(
                                'assets/images/mileage.svg',
                                width: 18,
                                height: 18,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              else
                IntrinsicWidth(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 49,
                        child: Text(
                          '반환될 모야',
                          style: TypoTextStyle.body3(
                            color: Palette.gray700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 12,
                          bottom: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.gray100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Text(
                              (fund.price / 5000).ceil().toString(),
                              style: TypoTextStyle.body1(
                                color: Palette.black,
                              ),
                            ),
                            const SizedBox(width: 6),
                            SvgPicture.asset('assets/images/moya.svg')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 34),
              Consumer<MyInfoProvider>(
                builder: (context, myInfoProvider, child) {
                  return PrimaryButton(
                    "펀드 정산하기",
                    onPressed: () async {
                      await provider.settleFund();
                      myInfoProvider.fetch();
                    },
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
