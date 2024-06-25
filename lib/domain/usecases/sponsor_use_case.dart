import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/sponsor_repository.dart';

class SponsorUseCase {
  Future<Result> call({
    required int fundId,
    required int moyaAmount,
    required String content,
    required bool isVisible,
  }) async {
    SponsorRepository repository = serviceLocator<SponsorRepository>();
    final result = await repository.fetch(
      fundId: fundId,
      moyaAmount: moyaAmount,
      content: content,
      isVisible: isVisible,
    );
    return result;
  }
}
