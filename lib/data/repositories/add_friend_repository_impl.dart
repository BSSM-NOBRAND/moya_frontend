import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/add_friend_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/add_friend_repository.dart';

class AddFriendRepositoryImpl implements AddFriendRepository {
  @override
  Future<Result> fetch({required int friendId}) async {
    AddFriendApi api = serviceLocator<AddFriendApi>();
    final result = await api.fetch(friendId: friendId);
    return result;
  }
}
