import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friend.dart';
import 'package:moya/presentation/add_friend/add_friend_screen.dart';
import 'package:moya/presentation/friend/widgets/my_friend_list_item.dart';
import 'package:moya/presentation/provider/my_friend_list_provider.dart';
import 'package:provider/provider.dart';

class MyFriendList extends StatelessWidget {
  const MyFriendList({super.key});

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
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddFriendScreen(),
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 16),
          Consumer<MyFriendListProvider>(
            builder: (context, provider, child) {
              List<Friend> friendList = provider.friendList;

              return ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: friendList.length,
                itemBuilder: (context, index) {
                  return MyFriendListItem(friend: friendList[index]);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
              );
            },
          )
        ],
      ),
    );
  }
}
