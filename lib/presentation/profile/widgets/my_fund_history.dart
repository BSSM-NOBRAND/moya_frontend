import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friend_fund_item.dart';
import 'package:moya/presentation/profile/widgets/my_fund_history_item.dart';
import 'package:moya/presentation/provider/friend_fund_list_provider.dart';
import 'package:provider/provider.dart';

class MyFundHistory extends StatelessWidget {
  const MyFundHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: Palette.gray200,
        ),
      ),
      child: Consumer<FriendFundListProvider>(
        builder: (context, provider, child) {
          List<FriendFundItem> friendFundList = provider.friendFundList;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '친구들의 생일 펀드',
                style: TypoTextStyle.h4(
                  color: Palette.black,
                ),
              ),
              if (friendFundList.isNotEmpty) const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: friendFundList.length,
                itemBuilder: (context, index) {
                  return MyFundHistoryItem(
                    friendFundItem: friendFundList[index],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
              ),
            ],
          );
        },
      ),
    );
  }
}
