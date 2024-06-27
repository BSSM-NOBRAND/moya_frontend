import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class VerifyFundApi {
  Future<Result> fetch({required int fundId}) async {
    try {
      final response = await myDio.patch(
        '/fund',
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
