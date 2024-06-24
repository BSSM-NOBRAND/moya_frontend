import 'package:moya/core/resources/result.dart';
import 'package:moya/domain/entities/friend.dart';

abstract class GetFriendListRepository {
  Future<Result<List<Friend>>> fetch();
}
