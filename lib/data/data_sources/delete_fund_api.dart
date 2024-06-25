import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class DeleteFundApi {
  Future<Result> fetch() async {
    try {
      final response = await myDio.delete(
        '/fund',
        options: authorization(),
      );
      return Result.success(response.data);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
