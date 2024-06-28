import 'package:moya/core/resources/result.dart';
import 'package:moya/domain/entities/my_sponsor.dart';

abstract class GetMySponsorListRepository {
  Future<Result<List<MySponsor>>> fetch();
}
