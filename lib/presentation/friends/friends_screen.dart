import 'package:flutter/material.dart';
import 'package:moya/presentation/friends/widgets/friends_birth_fund_list.dart';
import 'package:moya/presentation/friends/widgets/my_friend_list.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          FriendsBirthFundList(),
          const SizedBox(height: 12),
          MyFriendList(),
        ],
      ),
    );
  }
}
