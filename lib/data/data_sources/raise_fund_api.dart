import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class RaiseFundApi {
  Future<Result> fetch({required int id}) async {
    try {
      final response = await myDio.post(
        '/fund',
        queryParameters: {
          "wishListId": id,
        },
        options: authorization(),
      );
      return Result.success(response.data);
    } catch (e) {
      print(e);
      return const Result.error("네트워크 에러");
    }
  }
}
