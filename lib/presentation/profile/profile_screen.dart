import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moya/presentation/profile/widgets/profile_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Column(
        children: [
          ProfileBox(),
        ],
      ),
    );
  }
}
