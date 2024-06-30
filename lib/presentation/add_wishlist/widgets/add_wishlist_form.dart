import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/add_wishlist/provider/wishlist_item_preview_provider.dart';
import 'package:moya/presentation/add_wishlist/widgets/wishlist_item_preview.dart';
import 'package:moya/presentation/common/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddWishlistForm extends StatefulWidget {
  final void Function(String) findItem;

  const AddWishlistForm({
    super.key,
    required this.findItem,
  });

  @override
  State<AddWishlistForm> createState() => _AddWishlistFormState();
}

class _AddWishlistFormState extends State<AddWishlistForm> {
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
      widget.findItem(link);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: Consumer<WishlistItemPreviewProvider>(
        builder: (context, provider, child) {
          return Column(
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
                      CustomTextField(
                        controller: _controller,
                        hintText: '선물 구매 링크를 써줘',
                        onChanged: (value) {
                          setState(() {
                            link = value;
                            provider.initWishlistItemPreview();
                            widget.findItem(link);
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
                          style: ButtonStyle(
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.only(
                                left: 12,
                                right: 12,
                              ),
                            ),
                            backgroundColor:
                                const WidgetStatePropertyAll(Palette.gray100),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            overlayColor:
                                const WidgetStatePropertyAll(Palette.gray200),
                            elevation: const WidgetStatePropertyAll(0),
                          ),
                          child: Text(
                            '링크 붙여넣기',
                            style: TypoTextStyle.body2(color: Palette.gray750),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              if (provider.wishlistItem != null) const SizedBox(height: 32),
              if (provider.wishlistItem != null)
                WishlistItemPreview(
                  wishListItem: provider.wishlistItem!,
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
                    provider.initWishlistItemPreview();
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
