import 'package:flutter/material.dart';
import 'package:moya/presentation/friends/widgets/friends_birth_fund_list.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FriendsBirthFundList(),
    );
  }
}
