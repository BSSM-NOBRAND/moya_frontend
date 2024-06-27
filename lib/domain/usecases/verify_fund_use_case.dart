import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/verify_fund_repository.dart';

class VerifyFundUseCase {
  Future<Result> call({required int fundId}) async {
    VerifyFundRepository repository = serviceLocator<VerifyFundRepository>();
    final result = await repository.fetch(fundId: fundId);
    return result;
  }
}
