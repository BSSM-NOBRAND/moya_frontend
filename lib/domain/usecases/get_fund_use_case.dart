import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:moya/domain/repositories/get_fund_repository.dart';

class GetFundUseCase {
  Future<Result<Fund>> call() async {
    GetFundRepository repository = serviceLocator<GetFundRepository>();
    final result = await repository.fetch();
    return result;
  }
}
