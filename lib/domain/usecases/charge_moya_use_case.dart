import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/charge_moya_repository.dart';

class ChargeMoyaUseCase {
  Future<Result> call() async {
    ChargeMoyaRepository repository = serviceLocator<ChargeMoyaRepository>();
    final result = await repository.fetch();
    return result;
  }
}
