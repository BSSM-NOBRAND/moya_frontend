import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/settle_fund_repository.dart';

class SettleFundUseCase {
  Future<Result> call({required int fundId}) async {
    SettleFundRepository repository = serviceLocator<SettleFundRepository>();
    final result = await repository.fetch(fundId: fundId);
    return result;
  }
}
