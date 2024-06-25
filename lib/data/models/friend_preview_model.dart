import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moya/domain/entities/friend_preview_entity.dart';

part 'friend_preview_model.freezed.dart';
part 'friend_preview_model.g.dart';

@freezed
class FriendPreviewModel extends FriendPreview with _$FriendPreviewModel {
  const factory FriendPreviewModel({
    required int id,
    required String name,
    required String profileImage,
  }) = _FriendPreviewModel;

  factory FriendPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$FriendPreviewModelFromJson(json);
}
