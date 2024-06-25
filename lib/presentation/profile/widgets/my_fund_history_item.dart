import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friend_fund_item.dart';
import 'package:moya/presentation/friend_wishlist_fund_detail/friend_wishlist_fund_detail_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyFundHistoryItem extends StatelessWidget {
  final FriendFundItem friendFundItem;

  const MyFundHistoryItem({super.key, required this.friendFundItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FriendWishlistFundDetailScreen(
              friendFundItem: friendFundItem,
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Skeleton.replace(
              width: 64,
              height: 64,
              child: Image.network(friendFundItem.imageUrl),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  friendFundItem.productName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TypoTextStyle.body2(
                    color: Palette.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      friendFundItem.name,
                    ),
                    Row(
                      children: [
                        Text(
                          '${(friendFundItem.moya / friendFundItem.targetMoya * 100).floor()}%',
                        ),
                        const SizedBox(width: 12),
                        Text(
                            '${friendFundItem.moya}/${friendFundItem.targetMoya}'),
                        const SizedBox(width: 8),
                        SvgPicture.asset('assets/images/moya.svg'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Palette.gray200,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: friendFundItem.moya,
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: Palette.brandPrimary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: friendFundItem.targetMoya - friendFundItem.moya,
                        child: const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
