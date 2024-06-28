import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moya/domain/entities/sponsor.dart';

part 'sponsor_model.freezed.dart';
part 'sponsor_model.g.dart';

@freezed
class SponsorModel extends Sponsor with _$SponsorModel {
  factory SponsorModel({
    required String name,
    required String content,
    required bool isVisible,
    required int moyaAmount,
    required String date,
  }) = _SponsorModel;

  factory SponsorModel.fromJson(Map<String, dynamic> json) =>
      _$SponsorModelFromJson(json);
}
