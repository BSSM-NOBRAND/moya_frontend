import 'package:moya/core/resources/result.dart';

abstract class VerifyFundRepository {
  Future<Result> fetch({required int fundId});
}
