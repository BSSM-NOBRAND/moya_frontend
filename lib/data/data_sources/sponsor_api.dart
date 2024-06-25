import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class SponsorApi {
  Future<Result> fetch({
    required int fundId,
    required int moyaAmount,
    required String content,
    required bool isVisible,
  }) async {
    try {
      final response = await myDio.post(
        '/donate',
        data: {
          'moyaAmount': moyaAmount,
          'content': content,
          'isVisible': isVisible,
        },
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
