import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/presentation/home/widgets/settle_birth_modal_header.dart';
import 'package:moya/presentation/home/widgets/settle_birth_model_content.dart';

class SettleBirthModal extends StatelessWidget {
  const SettleBirthModal({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.only(
          top: 8,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        decoration: const BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Column(
          children: [
            const SettleBirthModalHeader(),
            const SizedBox(height: 15),
            SettleBirthModalContent(),
          ],
        ),
      ),
    );
  }
}
