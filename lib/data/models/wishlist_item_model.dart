import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moya/domain/entities/wishlist_item.dart';

part 'wishlist_item_model.freezed.dart';
part 'wishlist_item_model.g.dart';

@freezed
class WishlistItemModel extends WishlistItem with _$WishlistItemModel {
  factory WishlistItemModel({
    required int id,
    required String imageUrl,
    required String url,
    required String name,
    required int price,
  }) = _WishlistItemModel;

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemModelFromJson(json);
}
