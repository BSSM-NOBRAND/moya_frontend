import 'package:moya/core/resources/result.dart';

abstract class ExchangeMoyaRepository {
  Future<Result> fetch();
}
