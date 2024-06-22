import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/my_wishlist_api.dart';
import 'package:moya/data/models/wishlist_item_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/domain/repositories/my_wishlist_repository.dart';

class MyWishlistRepositoryImpl implements MyWishlistRepository {
  @override
  Future<Result<List<WishlistItem>>> fetch() async {
    final MyWishlistApi api = serviceLocator<MyWishlistApi>();
    final Result<Iterable> result = await api.fetch();

    return result.when(
      success: (iterable) => Result.success(
        iterable
            .map(
              (e) => WishlistItemModel.fromJson(e),
            )
            .toList(),
      ),
      error: (message) => Result.error(message),
    );
  }
}
