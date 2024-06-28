import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class GetSponsorListApi {
  Future<Result<Iterable>> fetch({required int fundId}) async {
    try {
      final response = await myDio.get(
        '/donate',
        options: authorization(),
        queryParameters: {'fundId': fundId},
      );
      return Result.success(response.data);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
