import 'package:flutter/material.dart';
import 'package:moya/presentation/friend/widgets/friend_birth_fund_list.dart';
import 'package:moya/presentation/friend/widgets/my_friend_list.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          FriendBirthFundList(),
          const SizedBox(height: 12),
          const MyFriendList(),
        ],
      ),
    );
  }
}
