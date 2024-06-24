import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_fund_api.dart';
import 'package:moya/data/models/fund_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:moya/domain/repositories/get_fund_repository.dart';

class GetFundRepositoryImpl implements GetFundRepository {
  @override
  Future<Result<Fund>> fetch() async {
    GetFundApi api = serviceLocator<GetFundApi>();
    final result = await api.fetch();
    return result.when(
      success: (json) => Result.success(
        FundModel.fromJson(json),
      ),
      error: (message) => Result.error(message),
    );
  }
}
