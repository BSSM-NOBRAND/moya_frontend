import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_friend_fund_list_api.dart';
import 'package:moya/data/models/friend_fund_item_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend_fund_item.dart';
import 'package:moya/domain/repositories/get_friend_fund_list_repository.dart';

class GetFriendFundListRepositoryImpl implements GetFriendFundListRepository {
  @override
  Future<Result<List<FriendFundItem>>> fetch() async {
    GetFriendFundListApi api = serviceLocator<GetFriendFundListApi>();
    final result = await api.fetch();
    return result.when(
      success: (iterable) => Result.success(
        iterable
            .map(
              (e) => FriendFundItemModel.fromJson(e),
            )
            .toList(),
      ),
      error: (message) => Result.error(message),
    );
  }
}
