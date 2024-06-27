import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/verify_fund_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/verify_fund_repository.dart';

class VerifyFundRepositoryImpl implements VerifyFundRepository {
  @override
  Future<Result> fetch({required int fundId}) async {
    VerifyFundApi api = serviceLocator<VerifyFundApi>();
    final result = await api.fetch(fundId: fundId);
    return result;
  }
}
