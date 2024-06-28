import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_sponsor_list_api.dart';
import 'package:moya/data/models/sponsor_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/sponsor.dart';
import 'package:moya/domain/repositories/get_sponsor_list_repository.dart';

class GetSponsorListRepositoryImpl implements GetSponsorListRepository {
  @override
  Future<Result<List<Sponsor>>> fetch({required int fundId}) async {
    GetSponsorListApi api = serviceLocator<GetSponsorListApi>();
    final result = await api.fetch(fundId: fundId);
    return result.when(
      success: (iterable) => Result.success(
        iterable
            .map(
              (sponsor) => SponsorModel.fromJson(sponsor),
            )
            .toList(),
      ),
      error: (message) => Result.error(message),
    );
  }
}
