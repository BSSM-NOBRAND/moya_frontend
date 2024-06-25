import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/exchange_moya_repository.dart';

class ExchangeMoyaUseCase {
  Future<Result> call() async {
    ExchangeMoyaRepository repository =
        serviceLocator<ExchangeMoyaRepository>();
    final result = repository.fetch();
    return result;
  }
}
