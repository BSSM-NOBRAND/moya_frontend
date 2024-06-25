import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moya/domain/entities/friend_fund_item.dart';

part 'friend_fund_item_model.freezed.dart';
part 'friend_fund_item_model.g.dart';

@freezed
class FriendFundItemModel extends FriendFundItem with _$FriendFundItemModel {
  factory FriendFundItemModel({
    required int id,
    required String username,
    required String productName,
    required int currentMoya,
    required int maxMoya,
    required String imageUrl,
  }) = _FriendFundItemModel;

  factory FriendFundItemModel.fromJson(Map<String, dynamic> json) =>
      _$FriendFundItemModelFromJson(json);
}
