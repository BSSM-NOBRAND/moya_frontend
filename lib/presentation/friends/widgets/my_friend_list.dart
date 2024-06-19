import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/my_friend.dart';
import 'package:moya/presentation/friends/widgets/my_friend_list_item.dart';

class MyFriendList extends StatelessWidget {
  final List<MyFriend> friendList = [
    const MyFriend(
      id: 1,
      profileUrl: 'https://storage.surfit.io/user/avatar/1745610414.png',
      username: '이명재',
      isFunding: true,
    ),
    const MyFriend(
      id: 2,
      profileUrl: 'https://storage.surfit.io/user/avatar/1745610414.png',
      username: '조우성',
      isFunding: false,
    ),
    const MyFriend(
      id: 3,
      profileUrl: 'https://storage.surfit.io/user/avatar/1745610414.png',
      username: '신준서',
      isFunding: false,
    ),
    const MyFriend(
      id: 3,
      profileUrl: 'https://storage.surfit.io/user/avatar/1745610414.png',
      username: '한예준',
      isFunding: false,
    ),
  ];

  MyFriendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: Palette.gray200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '내 친구',
                style: TypoTextStyle.h4(
                  color: Palette.black,
                ),
              ),
              InkWell(
                child: SvgPicture.asset('assets/images/add.svg'),
              )
            ],
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: friendList.length,
            itemBuilder: (context, index) {
              return MyFriendListItem(friend: friendList[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          )
        ],
      ),
    );
  }
}
