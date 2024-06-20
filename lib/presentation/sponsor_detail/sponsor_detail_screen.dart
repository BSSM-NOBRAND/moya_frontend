import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/common/detail_header.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/sponsor_detail/widgets/letter_form.dart';
import 'package:moya/presentation/sponsor_detail/widgets/moya_form.dart';
import 'package:moya/presentation/sponsor_detail/widgets/visibility_form.dart';

class SponsorDetailScreen extends StatefulWidget {
  const SponsorDetailScreen({super.key});

  @override
  State<SponsorDetailScreen> createState() => _SponsorDetailScreenState();
}

enum FormStep {
  moya,
  letter,
  visibility,
}

class _SponsorDetailScreenState extends State<SponsorDetailScreen> {
  FormStep step = FormStep.moya;
  String moya = '';
  String letter = '';
  // SponsorVisibility? sponsorVisibility;
  bool? isSponsorVisible;

  void handleButtonPressed() {
    setState(() {
      if (step == FormStep.moya) {
        step = FormStep.letter;
      } else if (step == FormStep.letter) {
        step = FormStep.visibility;
      } else if (step == FormStep.visibility) {
        print('후원하기');
        print('moya: $moya');
        print('letter: $letter');
        print('isSponsorVisible: $isSponsorVisible');
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DetailHeader(title: '후원하기'),
            if (step == FormStep.moya)
              MoyaForm(
                onMoyaChanged: (value) {
                  setState(() {
                    moya = value;
                  });
                },
              ),
            if (step == FormStep.letter)
              LetterForm(
                onLetterChanged: (value) {
                  setState(() {
                    letter = value;
                  });
                },
              ),
            if (step == FormStep.visibility)
              VisibilityForm(
                isSponsorVisible: isSponsorVisible,
                onChange: (value) {
                  setState(() {
                    isSponsorVisible = value;
                  });
                },
              ),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 8,
          left: 16,
          right: 16,
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              if (step == FormStep.letter)
                Text(
                  '지금 생각이 안나면 넘어가도 돼',
                  style: TypoTextStyle.body3(
                    color: Palette.gray500,
                  ),
                ),
              if (step == FormStep.letter) const SizedBox(height: 8),
              PrimaryButton(
                step != FormStep.visibility ? '다음' : '후원하기',
                onPressed: handleButtonPressed,
                disabled: step == FormStep.moya
                    ? moya.isEmpty
                    : step == FormStep.visibility
                        ? isSponsorVisible == null
                        : false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
