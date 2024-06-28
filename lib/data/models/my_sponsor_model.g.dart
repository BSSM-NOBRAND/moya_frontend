// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_sponsor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MySponsorModelImpl _$$MySponsorModelImplFromJson(Map<String, dynamic> json) =>
    _$MySponsorModelImpl(
      name: json['name'] as String,
      productName: json['productName'] as String,
      imageUrl: json['imageUrl'] as String,
      moyaAmount: (json['moyaAmount'] as num).toInt(),
    );

Map<String, dynamic> _$$MySponsorModelImplToJson(
        _$MySponsorModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'productName': instance.productName,
      'imageUrl': instance.imageUrl,
      'moyaAmount': instance.moyaAmount,
    };
