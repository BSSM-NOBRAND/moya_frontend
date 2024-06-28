import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/my_sponsor.dart';
import 'package:moya/domain/repositories/get_my_sponsor_list_repository.dart';

class GetMySponsorListUseCase {
  Future<Result<List<MySponsor>>> call() async {
    GetMySponsorListRepository repository =
        serviceLocator<GetMySponsorListRepository>();
    final result = await repository.fetch();
    return result;
  }
}
