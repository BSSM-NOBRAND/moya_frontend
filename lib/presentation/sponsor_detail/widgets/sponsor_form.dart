import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/common/custom_text_field.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:provider/provider.dart';

class SponsorForm extends StatelessWidget {
  const SponsorForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '얼마만큼 후원할거야?',
            style: TypoTextStyle.h4(color: Palette.black),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                keyboardType: TextInputType.number,
                hintText: '후원할 모야를 적어줘',
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '보유 모야 :',
                    style: TypoTextStyle.body2(
                      color: Palette.gray500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Consumer<MyInfoProvider>(
                    builder: (context, provider, child) {
                      return Text(
                        provider.myMoya.toString(),
                        style: TypoTextStyle.body2(
                          color: Palette.black,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    'assets/images/moya.svg',
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
