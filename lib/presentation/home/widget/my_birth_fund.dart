import 'package:flutter/material.dart';
import 'package:moya/presentation/home/widget/fund_progress_indicator.dart';

class MyBirthFund extends StatelessWidget {
  const MyBirthFund({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
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
        )
      ],
    );
  }
}
