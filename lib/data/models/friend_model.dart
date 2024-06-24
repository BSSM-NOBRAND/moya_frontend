import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moya/domain/entities/friend.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
class FriendModel extends Friend with _$FriendModel {
  factory FriendModel({
    required String profileImage,
    required String name,
    required bool isOpen,
  }) = _FriendModel;

  factory FriendModel.fromJson(Map<String, dynamic> json) =>
      _$FriendModelFromJson(json);
}
