import 'package:flutter/material.dart';
import 'package:moya/domain/entities/wishlist_item.dart';

class FundStateProvider with ChangeNotifier {
  bool _isFundRaised = false;
  WishlistItem? _wishlistItem;

  bool get isFundRaised => _isFundRaised;
  WishlistItem? get wishlistItem => _wishlistItem;

  void raiseBirthFund(WishlistItem wishlistItem) {
    _isFundRaised = true;
    _wishlistItem = wishlistItem;
    notifyListeners();
  }
}
