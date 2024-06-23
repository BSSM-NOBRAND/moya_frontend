import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/my_dio.dart';

class GetWishlistItemPreviewApi {
  Future<Result<Map>> fetch(String url) async {
    try {
      final response = await myDio.get(
        '/wishlist',
        options: Options(
          headers: {'url': url},
        ),
      );

      Map wishlistItem = response.data;
      return Result.success(wishlistItem);
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
