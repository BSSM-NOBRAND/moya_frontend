import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend_preview_entity.dart';
import 'package:moya/domain/repositories/get_friend_preview_repository.dart';

class GetFriendPreviewUseCase {
  Future<Result<FriendPreview>> call({required String userId}) async {
    GetFriendPreviewRepository repository =
        serviceLocator<GetFriendPreviewRepository>();
    final result = await repository.fetch(userId: userId);
    return result;
  }
}
