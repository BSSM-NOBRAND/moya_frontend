import 'package:moya/core/resources/result.dart';
import 'package:moya/domain/entities/wishlist_item.dart';

abstract class GetWishlistItemPreviewRepository {
  Future<Result<WishlistItem>> fetch(String url);
}
