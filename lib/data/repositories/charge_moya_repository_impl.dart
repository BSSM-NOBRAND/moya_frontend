import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/charge_moya_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/charge_moya_repository.dart';

class ChargeMoyaRepositoryImpl implements ChargeMoyaRepository {
  @override
  Future<Result> fetch() async {
    ChargeMoyaApi api = serviceLocator<ChargeMoyaApi>();
    final result = await api.fetch();
    return result;
  }
}
