import 'package:moya/core/resources/result.dart';
import 'package:moya/domain/entities/fund.dart';

abstract class GetFundRepository {
  Future<Result<Fund>> fetch();
}
