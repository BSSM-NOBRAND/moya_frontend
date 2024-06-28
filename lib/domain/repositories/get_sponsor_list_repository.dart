import 'package:moya/core/resources/result.dart';
import 'package:moya/domain/entities/sponsor.dart';

abstract class GetSponsorListRepository {
  Future<Result<List<Sponsor>>> fetch({required int fundId});
}
