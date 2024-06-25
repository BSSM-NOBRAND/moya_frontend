import 'package:moya/core/resources/result.dart';
import 'package:moya/domain/entities/friend_preview_entity.dart';

abstract class GetFriendPreviewRepository {
  Future<Result<FriendPreview>> fetch({required String userId});
}
