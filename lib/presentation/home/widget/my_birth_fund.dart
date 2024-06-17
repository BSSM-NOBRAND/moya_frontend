import 'package:flutter/material.dart' hide Step;
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
import 'package:share_plus/share_plus.dart';

class MyBirthFund extends StatelessWidget {
  const MyBirthFund({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<FundStateProvider>(
          builder: (context, provider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FundProgressIndicator(
                  text: '시작',
                  isActive: provider.step == FundStep.start,
                ),
                FundProgressIndicator(
                  text: '진행중',
                  isActive: provider.step == FundStep.inProcess,
                ),
                FundProgressIndicator(
                  text: '종료',
                  isActive: provider.step == FundStep.ended,
                ),
                FundProgressIndicator(
                  text: '인증',
                  isActive: provider.step == FundStep.verify,
                ),
              ],
            );
          },
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
              Consumer<FundStateProvider>(
                builder: (context, provider, child) {
                  return MyBirthFundProgress(
                    currentMoya: provider.moya!,
                    maxMoya: provider.maxMoya!,
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Consumer<FundStateProvider>(
                      builder: (context, provider, child) {
                        FundStep step = provider.step;

                        String text;
                        void Function() onPressed;

                        switch (step) {
                          case FundStep.inProcess:
                            text = "펀드 공유하기";
                            onPressed = () {
                              Share.share("내 생일 선물을 후원해줘!😀");
                            };
                            break;
                          case FundStep.ended:
                            text = "펀드 정산하기";
                            onPressed = () {};
                            break;
                          default:
                            text = "펀드 공유하기";
                            onPressed = () {};
                        }

                        return PrimaryButton(
                          text,
                          size: ButtonSize.s56,
                          onPressed: onPressed,
                        );
                      },
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
