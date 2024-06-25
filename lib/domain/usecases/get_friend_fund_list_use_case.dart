import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend_fund_item.dart';
import 'package:moya/domain/repositories/get_friend_fund_list_repository.dart';

class GetFriendFundListUseCase {
  Future<Result<List<FriendFundItem>>> call() async {
    GetFriendFundListRepository repository =
        serviceLocator<GetFriendFundListRepository>();
    final result = await repository.fetch();
    return result;
  }
}
