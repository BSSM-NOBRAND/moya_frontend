import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:moya/domain/repositories/get_my_fund_list_repository.dart';

class GetMyFundListUseCase {
  Future<Result<List<Fund>>> call() async {
    GetMyFundListRepository repository =
        serviceLocator<GetMyFundListRepository>();
    final result = await repository.fetch();
    return result;
  }
}
