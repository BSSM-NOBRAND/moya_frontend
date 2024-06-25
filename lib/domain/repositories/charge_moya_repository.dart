import 'package:moya/core/resources/result.dart';

abstract class ChargeMoyaRepository {
  Future<Result> fetch();
}
