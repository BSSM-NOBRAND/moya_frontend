import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class GetFundApi {
  Future<Result> fetch() async {
    try {
      final response = await myDio.get(
        '/fund',
        options: authorization(),
      );
      return Result.success(response.data);
    } catch (e) {
      return const Result.error("네트워크 에러");
    }
  }
}
