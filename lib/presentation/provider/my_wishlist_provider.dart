import 'package:flutter/material.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/data/models/api_loading_state.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/domain/usecases/add_wishlist_item_use_case.dart';
import 'package:moya/domain/usecases/delete_wishlist_item_use_case.dart';
import 'package:moya/domain/usecases/get_wishlist_use_case.dart';

class MyWishlistProvider with ChangeNotifier {
  ApiLoadingState _state = ApiLoadingState(false);

  ApiLoadingState get state => _state;

  List<WishlistItem> _wishlist = <WishlistItem>[];

  List<WishlistItem> get wishlist => _wishlist;

  void toggleWishlistItem(WishlistItem wishlistItem) async {
    if (_wishlist.where((item) => item.id == wishlistItem.id).isEmpty) {
      _wishlist.add(wishlistItem);
      addWishlistItem(
        imageUrl: wishlistItem.imageUrl,
        url: wishlistItem.url,
        name: wishlistItem.name,
        price: wishlistItem.price,
      );
    } else {
      _wishlist.removeWhere((item) => item.id == wishlistItem.id);
      DeleteWishlistItemUseCase useCase =
          serviceLocator<DeleteWishlistItemUseCase>();
      final result = await useCase.call(id: wishlistItem.id);
      result.when(
        success: (s) {},
        error: (e) {
          fetch();
        },
      );
      notifyListeners();
    }
  }

  Future<void> fetch() async {
    _state = state.copyWith(isLoading: true);

    GetWishlistUseCase useCase = serviceLocator<GetWishlistUseCase>();

    final Result<List<WishlistItem>> result = await useCase.call();

    result.when(
      success: (List<WishlistItem> wishlist) {
        print(wishlist);
        _wishlist = wishlist
            .map(
              (e) => WishlistItem(
                id: e.id,
                url: e.url,
                imageUrl: e.imageUrl,
                name: e.name,
                price: e.price,
              ),
            )
            .toList();
      },
      error: (message) {},
    );
    notifyListeners();
    _state = state.copyWith(isLoading: false);
  }

  void addWishlistItem({
    required String imageUrl,
    required String url,
    required String name,
    required int price,
  }) async {
    _wishlist.add(
      WishlistItem(
        id: -1,
        url: url,
        imageUrl: imageUrl,
        name: name,
        price: price,
      ),
    );
    notifyListeners();
    AddWishlistItemUseCase useCase = serviceLocator<AddWishlistItemUseCase>();
    final result = await useCase.call(
      name: name,
      url: url,
      price: price,
      imageUrl: imageUrl,
    );
    result.when(
      success: (s) {},
      error: (e) {
        fetch();
      },
    );
  }

  bool isExist(int id) => _wishlist.any((item) => item.id == id);
}
