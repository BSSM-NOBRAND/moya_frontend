import 'package:flutter/material.dart' hide Step;
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:moya/presentation/common/birth_fund_progress.dart';
import 'package:moya/presentation/common/my_birth_fund_image.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/home/widgets/fund_progress_indicator.dart';
import 'package:moya/presentation/home/widgets/my_birth_fund_dialog.dart';
import 'package:moya/presentation/home/widgets/my_birth_fund_header.dart';
import 'package:moya/presentation/home/widgets/settle_fund_modal.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:moya/presentation/sponsor_list/sponsor_list_screen.dart';
import 'package:moya/presentation/verified_card/verified_card_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MyBirthFund extends StatefulWidget {
  const MyBirthFund({super.key});

  @override
  State<MyBirthFund> createState() => _MyBirthFundState();
}

class _MyBirthFundState extends State<MyBirthFund> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FundStateProvider fundStateProvider =
        Provider.of<FundStateProvider>(context, listen: false);
    fundStateProvider.fetch();
  }

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
                  isActive: false,
                  onClick: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.7),
                      builder: (context) {
                        return MyBirthFundDialog(
                          imageUrl: 'assets/images/dialog1.png',
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                ),
                FundProgressIndicator(
                  text: '진행중',
                  isActive: provider.fund.state == "OPEN",
                  onClick: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.7),
                      builder: (context) {
                        return MyBirthFundDialog(
                          imageUrl: 'assets/images/dialog2.png',
                          height: 205,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          left: 19,
                        );
                      },
                    );
                  },
                ),
                FundProgressIndicator(
                  text: '종료',
                  isActive: provider.fund.state == "CLOSE",
                  onClick: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.7),
                      builder: (context) {
                        return MyBirthFundDialog(
                          imageUrl: 'assets/images/dialog3.png',
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          right: 18,
                        );
                      },
                    );
                  },
                ),
                FundProgressIndicator(
                  text: '인증',
                  isActive: provider.fund.state == "AUTHENTICATED",
                  onClick: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.7),
                      builder: (context) {
                        return MyBirthFundDialog(
                          imageUrl: 'assets/images/dialog4.png',
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          height: 185,
                          right: 0,
                        );
                      },
                    );
                  },
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
                  Fund fund = provider.fund;

                  final DateTime dDay = DateTime.parse(fund.finishedAt);
                  final Duration difference = DateTime.now().difference(dDay);

                  return MyBirthFundImage(
                    dDay: difference.inDays,
                    title: fund.name,
                    imageUrl: fund.imageUrl,
                  );
                },
              ),
              const SizedBox(height: 16),
              Consumer<FundStateProvider>(
                builder: (context, provider, child) {
                  return BirthFundProgress(
                    currentMoya: provider.fund.moya,
                    maxMoya: provider.fund.targetMoya,
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Consumer<FundStateProvider>(
                      builder: (context, provider, child) {
                        String text;
                        void Function() onPressed;

                        switch (provider.fund.state) {
                          case "OPEN":
                            text = "펀드 공유하기";
                            onPressed = () {
                              Share.share("내 생일 선물을 후원해줘!😀");
                            };
                            break;
                          case "CLOSE":
                            text = "펀드 정산하기";
                            onPressed = () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (context) {
                                  return const SettleFundModal();
                                },
                              );
                            };
                            break;
                          case "AUTHENTICATED":
                            text = "인증카드 받기";
                            onPressed = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => VerifiedCardScreen(),
                                ),
                              );
                            };
                          default:
                            text = "";
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SponsorListScreen(),
                            ),
                          );
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
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
