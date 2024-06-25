// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_fund_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendFundItemModelImpl _$$FriendFundItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendFundItemModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      productName: json['productName'] as String,
      moya: (json['moya'] as num).toInt(),
      targetMoya: (json['targetMoya'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$FriendFundItemModelImplToJson(
        _$FriendFundItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'productName': instance.productName,
      'moya': instance.moya,
      'targetMoya': instance.targetMoya,
      'imageUrl': instance.imageUrl,
    };
