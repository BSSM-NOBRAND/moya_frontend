import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/settle_fund_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/settle_fund_repository.dart';

class SettleFundRepositoryImpl implements SettleFundRepository {
  @override
  Future<Result> fetch({required int fundId}) async {
    SettleFundApi api = serviceLocator<SettleFundApi>();
    final result = await api.fetch(fundId: fundId);
    return result;
  }
}
