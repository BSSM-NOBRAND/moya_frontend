import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/domain/repositories/get_my_wishlist_repository.dart';

class GetWishlistUseCase {
  Future<Result<List<WishlistItem>>> call() async {
    GetMyWishlistRepository repository =
        serviceLocator<GetMyWishlistRepository>();

    final result = await repository.fetch();

    return result.when(
      success: (wishlist) => Result.success(wishlist),
      error: (error) => Result.error(error),
    );
  }
}
