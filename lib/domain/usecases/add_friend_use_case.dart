import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/add_friend_repository.dart';

class AddFriendUseCase {
  Future<Result> call({required int friendId}) async {
    AddFriendRepository repository = serviceLocator<AddFriendRepository>();
    final result = await repository.fetch(friendId: friendId);
    return result;
  }
}
