import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/my_dio.dart';

class DeleteWishlistItemApi {
  Future<Result> fetch({required int id}) async {
    try {
      final response = await myDio.delete('/wishlist', queryParameters: {
        "id": id,
      });
      return Result.success(response.data);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
