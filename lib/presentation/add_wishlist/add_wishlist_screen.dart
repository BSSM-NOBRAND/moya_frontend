import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/add_wishlist/add_wishlist_header.dart';
import 'package:moya/presentation/add_wishlist/wishlist_item_preview.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/provider/my_wishlist_provider.dart';
import 'package:provider/provider.dart';

class AddWishlistScreen extends StatefulWidget {
  const AddWishlistScreen({super.key});

  @override
  State<AddWishlistScreen> createState() => _AddWishlistScreenState();
}

class _AddWishlistScreenState extends State<AddWishlistScreen> {
  final TextEditingController _controller = TextEditingController();
  String link = '';
  String imageUrl = '';
  String title = '';
  int price = 0;

  void findItem() {
    imageUrl =
        'https://thumbnail8.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/b6b2/a2351221ee02e1500d9d87df0958a04040c81af5c516b045cde6a4bb4365.jpg';
    title =
        '호스티스 트윙키 크리미 골든 스폰지 케이크 10개입 HOSTESS TWINKIES Creamy Golden Sponge Cake 10ct';
    price = 8290;
  }

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
      findItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(imageUrl);
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
                                findItem();
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
                    WishlistItemPreview(
                      imageUrl: imageUrl,
                      title: title,
                      price: price,
                      onCancelTap: () {
                        setState(() {
                          _controller.value = _controller.value.copyWith(
                            text: '',
                            selection: TextSelection.fromPosition(
                              const TextPosition(offset: 0),
                            ),
                          );
                          link = '';
                        });
                      },
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
        child: PrimaryButton(
          '추가하기',
          onPressed: () {
            MyWishlistProvider myWishlistProvider =
                Provider.of<MyWishlistProvider>(context, listen: false);

            myWishlistProvider.addWishlistItem(
              imageUrl: imageUrl,
              title: title,
              price: price,
            );
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
