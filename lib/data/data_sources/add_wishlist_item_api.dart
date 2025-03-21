import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class AddWishlistItemApi {
  Future<Result> fetch({
    required String name,
    required String url,
    required int price,
    required String imageUrl,
  }) async {
    try {
      final response = await myDio.post(
        '/wishlist',
        data: {
          'name': name,
          'url': url,
          'price': price,
          'imageUrl': imageUrl,
        },
        options: authorization(),
      );
      return Result.success(response.data);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
