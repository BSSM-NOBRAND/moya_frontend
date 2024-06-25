import 'package:moya/core/resources/result.dart';

abstract class SponsorRepository {
  Future<Result> fetch({
    required int fundId,
    required int moyaAmount,
    required String content,
    required bool isVisible,
  });
}
