import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/delete_wishlist_item_repository.dart';

class DeleteWishlistItemUseCase {
  Future<Result> call({required int id}) async {
    DeleteWishlistItemRepository repository =
        serviceLocator<DeleteWishlistItemRepository>();
    final result = await repository.fetch(id: id);
    return result.when(
      success: (s) => Result.success(s),
      error: (e) => Result.error(e),
    );
  }
}
