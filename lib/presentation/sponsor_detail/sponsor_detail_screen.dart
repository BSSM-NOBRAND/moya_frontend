import 'package:flutter/material.dart';
import 'package:moya/presentation/common/detail_header.dart';
import 'package:moya/presentation/sponsor_detail/widgets/sponsor_form.dart';

class SponsorDetailScreen extends StatelessWidget {
  const SponsorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DetailHeader(title: '후원하기'),
            SponsorForm(),
          ],
        ),
      ),
    );
  }
}
