import 'package:flutter/material.dart';
import 'package:moya/presentation/friend/widgets/friend_birth_fund_list.dart';
import 'package:moya/presentation/friend/widgets/my_friend_list.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 12,
        left: 16,
        right: 16,
        bottom: 24,
      ),
      child: Column(
        children: [
          FriendBirthFundList(),
          SizedBox(height: 12),
          MyFriendList(),
        ],
      ),
    );
  }
}
