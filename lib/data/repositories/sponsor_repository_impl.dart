import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/sponsor_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/sponsor_repository.dart';

class SponsorRepositoryImpl implements SponsorRepository {
  @override
  Future<Result> fetch({
    required int fundId,
    required int moyaAmount,
    required String content,
    required bool isVisible,
  }) async {
    SponsorApi api = serviceLocator<SponsorApi>();
    final result = await api.fetch(
      fundId: fundId,
      moyaAmount: moyaAmount,
      content: content,
      isVisible: isVisible,
    );
    return result;
  }
}
