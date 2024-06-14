import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/home/widget/remove_confirm_bottom_sheet.dart';

class MyBirthFundHeader extends StatelessWidget {
  const MyBirthFundHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '내 생일 펀드',
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
    );
  }
}
