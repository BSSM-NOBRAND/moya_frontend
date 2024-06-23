import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_wishlist_item_preview_api.dart';
import 'package:moya/data/models/wishlist_item_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/domain/repositories/get_wishlist_item_preview_repository.dart';

class GetWishlistItemPreviewRepositoryImpl
    implements GetWishlistItemPreviewRepository {
  @override
  Future<Result<WishlistItem>> fetch(String url) async {
    // final
    final GetWishlistItemPreviewApi api =
        serviceLocator<GetWishlistItemPreviewApi>();
    final Result<Map> result = await api.fetch(url);

    return result.when(
      success: (item) => Result.success(
        WishlistItemModel(
          id: -1,
          imageUrl: item['imageUrl'],
          name: item['name'],
          price: item['price'],
        ),
      ),
      error: (message) => Result.error(message),
    );
  }
}
