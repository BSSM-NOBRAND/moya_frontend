import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class MyBirthFundImage extends StatelessWidget {
  final int dDay;
  final String title;
  final String imageUrl;

  const MyBirthFundImage({
    super.key,
    required this.dDay,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xff000000).withOpacity(0),
                        const Color(0xff000000).withOpacity(0.5),
                        const Color(0xff000000).withOpacity(0.75),
                      ],
                      stops: const [0, 0.75, 1],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Text(
                    title,
                    style: TypoTextStyle.body2(
                      color: Palette.white,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff000000).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'D-$dDay',
                  style: TypoTextStyle.body2(
                    color: Palette.white,
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
