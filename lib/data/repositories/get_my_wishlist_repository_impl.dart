import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_my_wishlist_api.dart';
import 'package:moya/data/models/wishlist_item_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/domain/repositories/get_my_wishlist_repository.dart';

class GetMyWishlistRepositoryImpl implements GetMyWishlistRepository {
  @override
  Future<Result<List<WishlistItem>>> fetch() async {
    final GetMyWishlistApi api = serviceLocator<GetMyWishlistApi>();
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
