import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/presentation/profile/widgets/profile_box_buttons.dart';
import 'package:moya/presentation/profile/widgets/profile_box_header.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
          ProfileBoxHeader(),
          const SizedBox(height: 12),
          const ProfileBoxButtons(),
        ],
      ),
    );
  }
}
