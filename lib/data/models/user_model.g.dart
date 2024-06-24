// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String,
      userId: json['userId'] as String,
      moya: (json['moya'] as num).toInt(),
      mileage: (json['mileage'] as num).toInt(),
      isOpen: json['isOpen'] as bool,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userId': instance.userId,
      'moya': instance.moya,
      'mileage': instance.mileage,
      'isOpen': instance.isOpen,
    };
