import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class MyBirthFundDialog extends StatelessWidget {
  final String imageUrl;
  final int height;
  final void Function() onTap;
  double? left;
  double? right;

  MyBirthFundDialog({
    super.key,
    required this.imageUrl,
    required this.onTap,
    this.height = 165,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.only(top: 61, left: 16, right: 16),
              child: Stack(
                children: [
                  Positioned(
                    left: left,
                    right: right,
                    child: SizedBox(
                      height: height.toDouble(),
                      child: Image.asset(
                        imageUrl,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 133 - MediaQuery.of(context).padding.bottom,
                ),
                child: SizedBox(
                  child: Text(
                    '터치해서 돌아가기',
                    style: TypoTextStyle.body1(
                      color: Palette.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
