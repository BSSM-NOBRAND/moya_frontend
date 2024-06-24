import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/delete_fund_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/delete_fund_repository.dart';

class DeleteFundRepositoryImpl implements DeleteFundRepository {
  @override
  Future<Result> fetch() async {
    DeleteFundApi api = serviceLocator<DeleteFundApi>();
    final result = await api.fetch();
    return result;
  }
}
