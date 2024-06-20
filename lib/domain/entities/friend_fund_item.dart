import 'package:moya/domain/entities/wishlist_item.dart';

class FriendFundItem {
  final int id;
  final String username;
  final int currentMoya;
  final int maxMoya;
  final int dDay;
  final WishlistItem wishlistItem;

  const FriendFundItem({
    required this.id,
    required this.username,
    required this.currentMoya,
    required this.maxMoya,
    required this.dDay,
    required this.wishlistItem,
  });
}
