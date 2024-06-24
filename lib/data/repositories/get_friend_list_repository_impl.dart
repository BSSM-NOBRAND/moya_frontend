import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_friend_list_api.dart';
import 'package:moya/data/models/friend_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend.dart';
import 'package:moya/domain/repositories/get_friend_list_repository.dart';

class GetFriendListRepositoryImpl implements GetFriendListRepository {
  @override
  Future<Result<List<Friend>>> fetch() async {
    GetFriendListApi api = serviceLocator<GetFriendListApi>();
    final result = await api.fetch();
    return result.when(
      success: (iterable) {
        return Result.success(
          iterable
              .map(
                (json) => FriendModel.fromJson(json),
              )
              .toList(),
        );
      },
      error: (message) => Result.error(message),
    );
  }
}
