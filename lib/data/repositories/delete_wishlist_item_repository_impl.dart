import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/delete_wishlist_item_api.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/repositories/delete_wishlist_item_repository.dart';

class DeleteWishlistItemRepositoryImpl implements DeleteWishlistItemRepository {
  @override
  Future<Result> fetch({required int id}) async {
    DeleteWishlistItemApi api = serviceLocator<DeleteWishlistItemApi>();
    final result = await api.fetch(id: id);

    return result.when(
      success: (s) => Result.success(s),
      error: (e) => Result.error(e),
    );
  }
}
