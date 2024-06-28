import 'package:moya/core/resources/result.dart';
import 'package:moya/domain/entities/fund.dart';

abstract class GetMyFundListRepository {
  Future<Result<List<Fund>>> fetch();
}
