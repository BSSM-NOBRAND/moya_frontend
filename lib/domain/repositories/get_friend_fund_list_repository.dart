import 'package:moya/core/resources/result.dart';
import 'package:moya/domain/entities/friend_fund_item.dart';

abstract class GetFriendFundListRepository {
  Future<Result<List<FriendFundItem>>> fetch();
}
