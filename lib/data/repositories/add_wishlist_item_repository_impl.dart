import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/add_wishlist_item_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/add_wishlist_item_repository.dart';

class AddWishlistItemRepositoryImpl implements AddWishlistItemRepository {
  @override
  Future<Result> fetch({
    required String name,
    required String url,
    required int price,
    required String imageUrl,
  }) async {
    final AddWishlistItemApi api = serviceLocator<AddWishlistItemApi>();
    final Result result = await api.fetch(
      name: name,
      url: url,
      price: price,
      imageUrl: imageUrl,
    );
    return result.when(
      success: (s) => Result.success(s),
      error: (e) => Result.error(e),
    );
  }
}
