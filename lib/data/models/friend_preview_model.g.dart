// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendPreviewModelImpl _$$FriendPreviewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendPreviewModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      profileImage: json['profileImage'] as String,
    );

Map<String, dynamic> _$$FriendPreviewModelImplToJson(
        _$FriendPreviewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImage': instance.profileImage,
    };
