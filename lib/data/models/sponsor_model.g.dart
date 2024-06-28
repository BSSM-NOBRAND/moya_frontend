// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SponsorModelImpl _$$SponsorModelImplFromJson(Map<String, dynamic> json) =>
    _$SponsorModelImpl(
      name: json['name'] as String,
      content: json['content'] as String,
      isVisible: json['isVisible'] as bool,
      moyaAmount: (json['moyaAmount'] as num).toInt(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$$SponsorModelImplToJson(_$SponsorModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'content': instance.content,
      'isVisible': instance.isVisible,
      'moyaAmount': instance.moyaAmount,
      'date': instance.date,
    };
