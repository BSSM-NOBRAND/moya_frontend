import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/home/widget/fund_progress_indicator.dart';
import 'package:moya/presentation/home/widget/my_birth_fund_header.dart';
import 'package:moya/presentation/home/widget/my_birth_fund_image.dart';
import 'package:moya/presentation/home/widget/my_birth_fund_progress.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:provider/provider.dart';

class MyBirthFund extends StatelessWidget {
  const MyBirthFund({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FundProgressIndicator(
              text: '시작',
              isActive: true,
            ),
            FundProgressIndicator(text: '진행중'),
            FundProgressIndicator(text: '종료'),
            FundProgressIndicator(text: '인증'),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              width: 1,
              color: Palette.gray200,
            ),
          ),
          child: Column(
            children: [
              const MyBirthFundHeader(),
              const SizedBox(height: 16),
              Consumer<FundStateProvider>(
                builder: (context, provider, child) {
                  WishlistItem wishlistItem = provider.wishlistItem!;

                  return MyBirthFundImage(
                    dDay: 7,
                    title: wishlistItem.title,
                    imageUrl: wishlistItem.imageUrl,
                  );
                },
              ),
              const SizedBox(height: 16),
              const MyBirthFundProgress(
                currentMoya: 12,
                totalMoya: 20,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: PrimaryButton(
                      "펀드 공유하기",
                      size: ButtonSize.s56,
                    ),
                  ),
                  const SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Material(
                      color: Palette.gray100,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        splashColor: Palette.gray200.withOpacity(0.3),
                        highlightColor: Colors.transparent,
                        onTap: () {
                          print("clicked");
                        },
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: SvgPicture.asset(
                            "assets/images/toc.svg",
                            width: 40,
                            height: 40,
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
