import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/my_dio.dart';

class DeleteWishlistItemApi {
  Future<Result> fetch({required int id}) async {
    try {
      final response = await myDio.delete('/wishlist', queryParameters: {
        "id": id,
      });
      return Result.success(response.data);
    } catch (e) {
      return const Result.error("네트워크 에러");
    }
  }
}
