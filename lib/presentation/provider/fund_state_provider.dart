import 'package:flutter/material.dart';
import 'package:moya/domain/entities/wishlist_item.dart';

enum FundStep { start, inProcess, ended, verify }

class FundStateProvider with ChangeNotifier {
  bool _isFundRaised = false;
  WishlistItem? _wishlistItem;
  int? _maxMoya;
  int? _moya;
  FundStep step = FundStep.ended;

  bool get isFundRaised => _isFundRaised;
  WishlistItem? get wishlistItem => _wishlistItem;
  int? get maxMoya => _maxMoya;
  int? get moya => _moya;

  void raiseBirthFund(WishlistItem wishlistItem) {
    _isFundRaised = true;
    _wishlistItem = wishlistItem;
    step = FundStep.inProcess;
    _maxMoya = (wishlistItem.price / 5000).ceil();
    _moya = 0;
    notifyListeners();
  }

  void withdrawFund() {
    _isFundRaised = false;
    _wishlistItem = null;
    step = FundStep.inProcess;
    _maxMoya = null;
    _moya = null;
    notifyListeners();
  }
}
