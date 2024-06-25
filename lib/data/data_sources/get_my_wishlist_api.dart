import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class GetMyWishlistApi {
  Future<Result<Iterable>> fetch() async {
    try {
      final response = await myDio.get(
        '/wishlist/list',
        options: authorization(),
      );

      Iterable wishlist = response.data;
      return Result.success(wishlist);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
