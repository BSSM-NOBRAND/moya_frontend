import 'package:flutter/material.dart';
import 'package:moya/domain/entities/wishlist_item.dart';

enum Step { start, inProcess, ended, verify }

class FundStateProvider with ChangeNotifier {
  bool _isFundRaised = false;
  WishlistItem? _wishlistItem;
  Step step = Step.start;

  bool get isFundRaised => _isFundRaised;
  WishlistItem? get wishlistItem => _wishlistItem;

  void raiseBirthFund(WishlistItem wishlistItem) {
    _isFundRaised = true;
    _wishlistItem = wishlistItem;
    step = Step.start;
    notifyListeners();
  }

  void withdrawFund() {
    _isFundRaised = false;
    _wishlistItem = null;
    step = Step.start;
    notifyListeners();
  }
}
