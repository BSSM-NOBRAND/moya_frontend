import 'package:moya/core/resources/result.dart';

abstract class AddFriendRepository {
  Future<Result> fetch({required int friendId});
}
