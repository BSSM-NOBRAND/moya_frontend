import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/exchange_moya_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/exchange_moya_repository.dart';

class ExchangeMoyaRepositoryImpl implements ExchangeMoyaRepository {
  @override
  Future<Result> fetch() async {
    ExchangeMoyaApi api = serviceLocator<ExchangeMoyaApi>();
    final result = await api.fetch();
    return result;
  }
}
