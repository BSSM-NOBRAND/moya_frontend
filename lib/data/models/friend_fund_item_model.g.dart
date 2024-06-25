// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_fund_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendFundItemModelImpl _$$FriendFundItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendFundItemModelImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      productName: json['productName'] as String,
      currentMoya: (json['currentMoya'] as num).toInt(),
      maxMoya: (json['maxMoya'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$FriendFundItemModelImplToJson(
        _$FriendFundItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'productName': instance.productName,
      'currentMoya': instance.currentMoya,
      'maxMoya': instance.maxMoya,
      'imageUrl': instance.imageUrl,
    };
