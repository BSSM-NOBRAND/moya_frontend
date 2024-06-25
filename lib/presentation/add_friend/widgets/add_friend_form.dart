import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/presentation/add_friend/provider/friend_preview_provider.dart';
import 'package:moya/presentation/add_friend/widgets/friend_preview_box.dart';
import 'package:moya/presentation/common/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddFriendForm extends StatefulWidget {
  const AddFriendForm({
    super.key,
  });

  @override
  State<AddFriendForm> createState() => _AddFriendFormState();
}

class _AddFriendFormState extends State<AddFriendForm> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  String friendId = '';

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: Consumer<FriendPreviewProvider>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '추가하고 싶은 친구가 있어?',
                style: TypoTextStyle.h4(color: Palette.black),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<FriendPreviewProvider>(
                    builder: (context, provider, child) {
                      return CustomTextField(
                        controller: _controller,
                        hintText: "친구 아이디를 써줘",
                        onChanged: (value) {
                          setState(() {
                            friendId = value;
                          });
                          if (_debounce?.isActive ?? false) _debounce?.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 500), () {
                            provider.fetch(userId: friendId);
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '아이디는 프로필 탭에서 확인할 수 있어',
                    style: TypoTextStyle.body3(
                      color: Palette.gray500,
                    ),
                  ),
                ],
              ),
              if (provider.friendPreview != null) const SizedBox(height: 32),
              if (provider.friendPreview != null)
                FriendPreviewBox(
                  friendPreview: provider.friendPreview!,
                  onCancelTap: () {
                    setState(() {
                      _controller.value = _controller.value.copyWith(
                        text: '',
                        selection: TextSelection.fromPosition(
                          const TextPosition(offset: 0),
                        ),
                      );
                      friendId = '';
                      provider.removeFriendPreview();
                    });
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
