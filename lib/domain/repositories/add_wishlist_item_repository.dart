import 'package:moya/core/resources/result.dart';

abstract class AddWishlistItemRepository {
  Future<Result> fetch({
    required String name,
    required String url,
    required int price,
    required String imageUrl,
  });
}
