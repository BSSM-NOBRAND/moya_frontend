import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_my_sponsor_list_api.dart';
import 'package:moya/data/models/my_sponsor_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/my_sponsor.dart';
import 'package:moya/domain/repositories/get_my_sponsor_list_repository.dart';

class GetMySponsorListRepositoryImpl implements GetMySponsorListRepository {
  @override
  Future<Result<List<MySponsor>>> fetch() async {
    GetMySponsorListApi api = serviceLocator<GetMySponsorListApi>();
    final result = await api.fetch();
    return result.when(
      success: (iterable) => Result.success(
          iterable.map((item) => MySponsorModel.fromJson(item)).toList()),
      error: Result.error,
    );
  }
}
