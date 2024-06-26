import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class SettleFundApi {
  Future<Result> fetch({required int fundId}) async {
    try {
      final response = await myDio.post(
        '/fund/calculate',
        options: authorization(),
        queryParameters: {
          'fundId': fundId,
        },
      );
      return Result.success(response.data);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
