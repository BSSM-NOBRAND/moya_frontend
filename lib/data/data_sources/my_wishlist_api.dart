import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class MyWishlistApi {
  Future<Result<Iterable>> fetch() async {
    try {
      final response = await myDio.get(
        '/wishlist/list',
        options: authorization(),
      );

      var jsonResponse = response.data;
      Iterable wishlist = jsonResponse;
      return Result.success(wishlist);
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
