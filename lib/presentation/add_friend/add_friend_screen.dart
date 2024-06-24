import 'package:flutter/material.dart';
import 'package:moya/domain/entities/friend.dart';
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

  void findFriend(String id) {
    setState(() {
      if (id.isEmpty) {
        friend = null;
        return;
      }
      friend = const Friend(
        profileImage: 'https://storage.surfit.io/user/avatar/1745610414.png',
        name: 'ddoory1103',
        isOpen: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DetailHeader(title: '친구 추가'),
            AddFriendForm(
              findFriend: findFriend,
              friend: friend,
            ),
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
          '친구 추가하기',
          onPressed: () {
            if (friend != null) {
              MyFriendListProvider myFriendListProvider =
                  Provider.of<MyFriendListProvider>(context, listen: false);
              myFriendListProvider.addFriend(
                profileUrl: friend!.profileImage,
                username: friend!.name,
                isFunding: friend!.isOpen,
              );
              Navigator.of(context).pop();
            }
          },
          disabled: friend == null,
        ),
      ),
    );
  }
}
