import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/delete_fund_repository.dart';

class DeleteFundUseCase {
  Future<Result> call() async {
    DeleteFundRepository repository = serviceLocator<DeleteFundRepository>();
    final result = await repository.fetch();
    return result;
  }
}
