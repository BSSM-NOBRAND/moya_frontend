import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/sponsor_detail/widgets/visibility_option.dart';

class VisibilityForm extends StatefulWidget {
  final bool? isSponsorVisible;
  final void Function(bool) onChange;

  const VisibilityForm({
    super.key,
    required this.isSponsorVisible,
    required this.onChange,
  });

  @override
  State<VisibilityForm> createState() => _VisibilityFormState();
}

class _VisibilityFormState extends State<VisibilityForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '익명으로 후원할건지 골라줘',
            style: TypoTextStyle.h4(
              color: Palette.black,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              VisibilityOption(
                text: '공개 후원',
                iconPath: 'assets/images/visibility.svg',
                isSelected: widget.isSponsorVisible == true,
                onTap: () {
                  setState(() {
                    widget.onChange(true);
                  });
                },
              ),
              const SizedBox(width: 12),
              VisibilityOption(
                text: '익명 후원',
                iconPath: 'assets/images/visibility_off.svg',
                isSelected: widget.isSponsorVisible == false,
                onTap: () {
                  setState(() {
                    widget.onChange(false);
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '익명 후원을 하면 후원 기록에는 남지만 네 이름은 가려져.\n하지만 펀드가 종료된 후에는 상대방이 네 이름을 볼 수 있어.',
            style: TypoTextStyle.p3(color: Palette.gray500),
          )
        ],
      ),
    );
  }
}
