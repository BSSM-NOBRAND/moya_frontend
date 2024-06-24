import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend.dart';
import 'package:moya/domain/repositories/get_friend_list_repository.dart';

class GetFriendListUseCase {
  Future<Result<List<Friend>>> call() async {
    GetFriendListRepository repository =
        serviceLocator<GetFriendListRepository>();
    final result = await repository.fetch();
    return result;
  }
}
