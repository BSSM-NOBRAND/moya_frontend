import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friend.dart';
import 'package:moya/presentation/add_friend/widgets/friend_preview.dart';

class AddFriendForm extends StatefulWidget {
  final void Function(String) findFriend;
  final Friend? friend;

  const AddFriendForm({
    super.key,
    required this.findFriend,
    required this.friend,
  });

  @override
  State<AddFriendForm> createState() => _AddFriendFormState();
}

class _AddFriendFormState extends State<AddFriendForm> {
  final TextEditingController _controller = TextEditingController();
  String friendId = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: Column(
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
              TextField(
                controller: _controller,
                cursorColor: Palette.brandPrimary,
                style: TypoTextStyle.h3(
                  color: Palette.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 0),
                  hintText: "친구 아이디를 써줘",
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
                    friendId = value;
                    widget.findFriend(friendId);
                  });
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
          if (widget.friend != null) const SizedBox(height: 32),
          if (widget.friend != null)
            FriendPreview(
              friend: widget.friend!,
              onCancelTap: () {
                setState(() {
                  _controller.value = _controller.value.copyWith(
                    text: '',
                    selection: TextSelection.fromPosition(
                      const TextPosition(offset: 0),
                    ),
                  );
                  friendId = '';
                });
              },
            ),
        ],
      ),
    );
  }
}
