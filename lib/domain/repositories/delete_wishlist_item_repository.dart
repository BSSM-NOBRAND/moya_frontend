import 'package:moya/core/resources/result.dart';

abstract class DeleteWishlistItemRepository {
  Future<Result> fetch({required int id});
}
