import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_friend_preview_api.dart';
import 'package:moya/data/models/friend_preview_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend_preview_entity.dart';
import 'package:moya/domain/repositories/get_friend_preview_repository.dart';

class GetFriendPreviewRepositoryImpl implements GetFriendPreviewRepository {
  @override
  Future<Result<FriendPreview>> fetch({required String userId}) async {
    GetFriendPreviewApi api = serviceLocator<GetFriendPreviewApi>();
    final result = await api.fetch(userId: userId);
    return result.when(
      success: (json) => Result.success(FriendPreviewModel.fromJson(json)),
      error: Result.error,
    );
  }
}
