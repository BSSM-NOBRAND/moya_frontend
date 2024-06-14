import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/home/widget/fund_progress_indicator.dart';
import 'package:moya/presentation/home/widget/remove_confirm_bottom_sheet.dart';

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
              Row(
                children: [
                  Text(
                    '내 위시리스트',
                    style: TypoTextStyle.h4(color: Palette.black),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      SvgPicture.asset('assets/images/close.svg'),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          splashColor: Palette.gray300.withOpacity(0.3),
                          highlightColor: Colors.transparent,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) {
                                return const RemoveConfirmBottomSheet();
                              },
                            );
                          },
                        ),
                      ),
                    ],
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
