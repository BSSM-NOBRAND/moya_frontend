import 'package:flutter/material.dart';
import 'package:moya/domain/entities/friend.dart';
import 'package:moya/domain/entities/friend_preview_entity.dart';
import 'package:moya/presentation/add_friend/provider/friend_preview_provider.dart';
import 'package:moya/presentation/add_friend/widgets/add_friend_form.dart';
import 'package:moya/presentation/common/detail_header.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/provider/my_friend_list_provider.dart';
import 'package:provider/provider.dart';

class AddFriendScreen extends StatefulWidget {
  const AddFriendScreen({super.key});

  @override
  State<AddFriendScreen> createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  Friend? friend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Column(
          children: [
            DetailHeader(title: '친구 추가'),
            AddFriendForm(),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 8,
          left: 16,
          right: 16,
        ),
        child: Consumer<FriendPreviewProvider>(
          builder: (context, friendPreviewProvider, child) {
            FriendPreview? friendPreview = friendPreviewProvider.friendPreview;
            return PrimaryButton(
              '친구 추가하기',
              onPressed: () {
                if (friendPreview != null) {
                  MyFriendListProvider myFriendListProvider =
                      Provider.of<MyFriendListProvider>(context, listen: false);
                  myFriendListProvider.addFriend(
                    friendPreview: friendPreview,
                  );
                  friendPreviewProvider.removeFriendPreview();
                  Navigator.of(context).pop();
                }
              },
              disabled: friendPreviewProvider.friendPreview == null,
            );
          },
        ),
      ),
    );
  }
}
