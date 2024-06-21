import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/profile/widgets/my_sponsor_history_item.dart';

class MySponsorHistory extends StatelessWidget {
  const MySponsorHistory({super.key});

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
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            "내 후원 기록",
            style: TypoTextStyle.h4(
              color: Palette.black,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return const MySponsorHistoryItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
