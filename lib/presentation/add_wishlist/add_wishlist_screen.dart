import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/add_wishlist/add_wishlist_header.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddWishlistScreen extends StatefulWidget {
  const AddWishlistScreen({super.key});

  @override
  State<AddWishlistScreen> createState() => _AddWishlistScreenState();
}

class _AddWishlistScreenState extends State<AddWishlistScreen> {
  final TextEditingController _controller = TextEditingController();
  String link = '';

  void pasteClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    setState(() {
      if (clipboardData == null) return;

      _controller.value = _controller.value.copyWith(
        text: clipboardData.text,
        selection: TextSelection.fromPosition(
          TextPosition(offset: clipboardData.text!.length),
        ),
      );
      link = clipboardData.text!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AddWishlistHeader(),
            Padding(
              padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '받고 싶은 선물이 있어?',
                        style: TypoTextStyle.h4(color: Palette.black),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            cursorColor: Palette.brandPrimary,
                            style: TypoTextStyle.h3(
                              color: Palette.black,
                            ),
                            controller: _controller,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 0),
                              hintText: "선물 구매 링크를 써줘",
                              hintStyle: TypoTextStyle.h3(
                                color: Palette.gray400,
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.gray400,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.gray400,
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                link = value;
                              });
                            },
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                pasteClipboardText();
                              },
                              style: const ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                  ),
                                ),
                                backgroundColor:
                                    WidgetStatePropertyAll(Palette.gray100),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                                overlayColor:
                                    WidgetStatePropertyAll(Palette.gray200),
                                elevation: WidgetStatePropertyAll(0),
                              ),
                              child: Text(
                                '링크 붙여넣기',
                                style:
                                    TypoTextStyle.body2(color: Palette.gray750),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  if (link.isNotEmpty) const SizedBox(height: 32),
                  if (link.isNotEmpty)
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Skeleton.replace(
                            width: 72,
                            height: 72,
                            child: Image.network(
                              'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/3bd6/012fa974b9fe0ccea7ca3db1ead1fdbab000c48883d232dc4c47fb319aaa.jpg',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '[맨시티 공식 굿즈] 스너지 엘링 필 포든 미니미 돌 쿠션 굿즈 인형',
                                      style: TypoTextStyle.body2(
                                          color: Palette.black),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  SvgPicture.asset('assets/images/close.svg')
                                ],
                              ),
                              const SizedBox(height: 9),
                              Text(
                                '₩56,000',
                                style: TypoTextStyle.body2(
                                  color: Palette.black,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 8,
          left: 16,
          right: 16,
        ),
        child: const PrimaryButton('추가하기'),
      ),
    );
  }
}
