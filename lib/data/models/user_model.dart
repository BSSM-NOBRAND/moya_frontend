import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moya/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends User with _$UserModel {
  factory UserModel({
    required String name,
    required String userId,
    required int moya,
    required int mileage,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
