import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/common/detail_header.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/verified_card/widgets/verified_card.dart';

class VerifiedCardScreen extends StatelessWidget {
  final MethodChannel _channel =
      const MethodChannel("moya.flutter.dev/save_image");
  final globalKey = GlobalKey();

  VerifiedCardScreen({super.key});

  void saveVerifiedCardImage() async {
    final RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(
        pixelRatio: MediaQuery.of(globalKey.currentContext!).devicePixelRatio);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // base64Encode();

    try {
      final result = await _channel.invokeMethod<String>(
        'saveImageToAlbumMoya',
        {'image': base64Encode(pngBytes)},
      );
      print(result);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DetailHeader(title: "인증카드"),
            Padding(
              padding: const EdgeInsets.only(
                top: 9,
                left: 16,
                right: 16,
              ),
              child:
                  RepaintBoundary(key: globalKey, child: const VerifiedCard()),
            ),
            const SizedBox(height: 24),
            Text(
              '인증카드로 친구들에게 선물을 자랑해봐!',
              style: TypoTextStyle.body2(
                color: Palette.gray600,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 16,
          left: 16,
          right: 16,
        ),
        child: Row(
          children: [
            const Expanded(
              child: PrimaryButton(
                '인증카드 공유하기',
                size: ButtonSize.s56,
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Material(
                color: Palette.gray100,
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  splashColor: Palette.gray200.withOpacity(0.3),
                  highlightColor: Colors.transparent,
                  onTap: () {
                    saveVerifiedCardImage();
                  },
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: SvgPicture.asset(
                      "assets/images/download.svg",
                      width: 40,
                      height: 40,
                      fit: BoxFit.none,
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
