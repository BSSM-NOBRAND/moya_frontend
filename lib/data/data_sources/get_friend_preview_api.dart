import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class GetFriendPreviewApi {
  Future<Result<Map<String, dynamic>>> fetch({required String userId}) async {
    try {
      final response = await myDio.get(
        '/friend/$userId',
        options: authorization(),
      );
      return Result.success(response.data);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
