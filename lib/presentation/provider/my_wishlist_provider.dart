import 'package:flutter/material.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/domain/usecases/get_wishlist_use_case.dart';

class MyWishlistProvider with ChangeNotifier {
  List<WishlistItem> _wishlist = <WishlistItem>[];

  List<WishlistItem> get wishlist => _wishlist;

  int _nextId = 4;

  void toggleWishlistItem(WishlistItem wishlistItem) {
    if (_wishlist.where((item) => item.id == wishlistItem.id).isEmpty) {
      _wishlist.add(wishlistItem);
    } else {
      _wishlist.removeWhere((item) => item.id == wishlistItem.id);
    }
    notifyListeners();
  }

  Future<void> fetch() async {
    GetWishlistUseCase useCase = serviceLocator<GetWishlistUseCase>();

    final Result<List<WishlistItem>> result = await useCase.call();

    result.when(
      success: (wishlist) {
        _wishlist = wishlist;
      },
      error: (message) {},
    );
    notifyListeners();
  }

  void addWishlistItem({
    required String imageUrl,
    required String title,
    required int price,
  }) {
    _wishlist.add(
      WishlistItem(
        id: _nextId++,
        imageUrl: imageUrl,
        name: title,
        price: price,
      ),
    );
    notifyListeners();
  }

  bool isExist(int id) => _wishlist.any((item) => item.id == id);
}
