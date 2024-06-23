import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class GetUserApi {
  Future<Result<Map>> fetch() async {
    try {
      final response = await myDio.get(
        '/user',
        options: authorization(),
      );
      Map user = response.data;
      return Result.success(user);
    } catch (e) {
      return const Result.error("네트워크 에러");
    }
  }
}
