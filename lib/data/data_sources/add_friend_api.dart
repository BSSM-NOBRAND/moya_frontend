import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class AddFriendApi {
  Future<Result> fetch({required int friendId}) async {
    try {
      final response = await myDio.post(
        '/friend',
        options: authorization(),
        queryParameters: {
          'friendId': friendId,
        },
      );
      return Result.success(response.data);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
