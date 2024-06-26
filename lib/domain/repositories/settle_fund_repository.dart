import 'package:moya/core/resources/result.dart';

abstract class SettleFundRepository {
  Future<Result> fetch({required int fundId});
}
