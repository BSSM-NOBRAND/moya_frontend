import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_my_fund_list_api.dart';
import 'package:moya/data/models/fund_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:moya/domain/repositories/get_my_fund_list_repository.dart';

class GetMyFundListRepositoryImpl implements GetMyFundListRepository {
  @override
  Future<Result<List<Fund>>> fetch() async {
    GetMyFundListApi api = serviceLocator<GetMyFundListApi>();
    final result = await api.fetch();
    return result.when(
      success: (iterable) => Result.success(
          iterable.map((item) => FundModel.fromJson(item)).toList()),
      error: Result.error,
    );
  }
}
