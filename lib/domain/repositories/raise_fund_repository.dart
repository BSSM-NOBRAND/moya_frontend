import 'package:moya/core/resources/result.dart';

abstract class RaiseFundRepository {
  Future<Result> fetch({required int id});
}
