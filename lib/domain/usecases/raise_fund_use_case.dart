import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/raise_fund_repository.dart';

class RaiseFundUseCase {
  Future<Result> call({required int id}) async {
    RaiseFundRepository repository = serviceLocator<RaiseFundRepository>();
    final result = await repository.fetch(id: id);
    return result;
  }
}
