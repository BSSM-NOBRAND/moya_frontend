import 'package:flutter/material.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/domain/usecases/get_wishlist_item_preview_use_case.dart';

class WishlistItemPreviewProvider with ChangeNotifier {
  WishlistItem? _wishlistItem;

  WishlistItem? get wishlistItem => _wishlistItem;

  Future<void> fetch(String url) async {
    GetWishlistItemPreviewUseCase useCase =
        serviceLocator<GetWishlistItemPreviewUseCase>();

    final Result<WishlistItem> result = await useCase.call(url);

    result.when(
      success: (item) {
        _wishlistItem = item;
      },
      error: (message) {
        _wishlistItem = null;
      },
    );
    notifyListeners();
  }

  void initWishlistItemPreview() {
    _wishlistItem = null;
    notifyListeners();
  }
}
