import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moya/domain/entities/fund.dart';

part 'fund_model.freezed.dart';
part 'fund_model.g.dart';

@freezed
class FundModel extends Fund with _$FundModel {
  factory FundModel({
    required int id,
    required String name,
    required String imageUrl,
    required int price,
    required int moya,
    required int targetMoya,
    required String finishedAt,
    required String state,
  }) = _FundModel;

  factory FundModel.fromJson(Map<String, dynamic> json) =>
      _$FundModelFromJson(json);
}
