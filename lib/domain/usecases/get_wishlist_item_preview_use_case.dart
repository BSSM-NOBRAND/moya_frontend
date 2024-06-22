import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/domain/repositories/wishlist_item_preview_repository.dart';

class GetWishlistItemPreviewUseCase {
  Future<Result<WishlistItem>> call(String url) async {
    WishlistItemPreviewRepository repository =
        serviceLocator<WishlistItemPreviewRepository>();

    final result = await repository.fetch(url);

    return result.when(
      success: (item) => Result.success(item),
      error: (message) => Result.error(message),
    );
  }
}
