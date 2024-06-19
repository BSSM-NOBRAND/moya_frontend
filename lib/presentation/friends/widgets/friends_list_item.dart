import 'package:flutter/material.dart';
import 'package:moya/domain/entities/my_friend.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FriendsListItem extends StatelessWidget {
  final MyFriend friend;
  const FriendsListItem({
    super.key,
    required this.friend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Skeleton.replace(
            width: 48,
            height: 48,
            child: Image.network(friend.profileUrl),
          ),
        ),
      ],
    );
  }
}
