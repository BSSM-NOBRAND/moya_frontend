import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/sponsor.dart';
import 'package:moya/domain/repositories/get_sponsor_list_repository.dart';

class GetSponsorListUseCase {
  Future<Result<List<Sponsor>>> call({required int fundId}) async {
    GetSponsorListRepository repository =
        serviceLocator<GetSponsorListRepository>();
    final result = await repository.fetch(fundId: fundId);
    return result;
  }
}
