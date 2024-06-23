import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/add_wishlist_item_repository.dart';

class AddWishlistItemUseCase {
  Future<Result> call({
    required String name,
    required String url,
    required int price,
    required String imageUrl,
  }) async {
    AddWishlistItemRepository repository =
        serviceLocator<AddWishlistItemRepository>();

    final result = await repository.fetch(
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
