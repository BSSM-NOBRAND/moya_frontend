import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moya/domain/entities/my_sponsor.dart';

part 'my_sponsor_model.freezed.dart';
part 'my_sponsor_model.g.dart';

@freezed
class MySponsorModel extends MySponsor with _$MySponsorModel {
  factory MySponsorModel({
    required String name,
    required String productName,
    required String imageUrl,
    required int moyaAmount,
  }) = _MySponsorModel;

  factory MySponsorModel.fromJson(Map<String, dynamic> json) =>
      _$MySponsorModelFromJson(json);
}
