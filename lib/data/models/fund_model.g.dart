// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FundModelImpl _$$FundModelImplFromJson(Map<String, dynamic> json) =>
    _$FundModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toInt(),
      moya: (json['moya'] as num).toInt(),
      targetMoya: (json['targetMoya'] as num).toInt(),
      finishedAt: json['finishedAt'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$$FundModelImplToJson(_$FundModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'moya': instance.moya,
      'targetMoya': instance.targetMoya,
      'finishedAt': instance.finishedAt,
      'state': instance.state,
    };
