import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class GetUserApi {
  Future<Result> fetch() async {
    try {
      final response = await myDio.get(
        '/user',
        options: authorization(),
      );
      return Result.success(response.data);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
