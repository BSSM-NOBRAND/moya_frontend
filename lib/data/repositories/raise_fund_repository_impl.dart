import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/raise_fund_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/raise_fund_repository.dart';

class RaiseFundRepositoryImpl implements RaiseFundRepository {
  @override
  Future<Result> fetch({required int id}) async {
    RaiseFundApi api = serviceLocator<RaiseFundApi>();
    final result = api.fetch(id: id);
    return result;
  }
}
