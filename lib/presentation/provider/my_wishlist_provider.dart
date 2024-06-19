import 'package:flutter/material.dart';
import 'package:moya/domain/entities/wishlist_item.dart';

class MyWishlistProvider with ChangeNotifier {
  final List<WishlistItem> _wishlist = <WishlistItem>[
    const WishlistItem(
      id: 1,
      imageUrl:
          'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/1c46/6070d09419b8197c5d4d0e7fd0bc2cafd18f47e54a80f2ca2592025512bc.jpg',
      title: '켈로그 팝타르트 프로스트 스트로베리, 384g, 1개',
      price: 8040,
    ),
    const WishlistItem(
      id: 2,
      imageUrl:
          'https://thumbnail10.coupangcdn.com/thumbnails/remote/492x492ex/image/retail/images/1644208474607669-5e1ffc52-6270-4c17-880a-fdde32758b92.png',
      title: '행복한댕냥이 고양이 숨숨집 하우스',
      price: 19800,
    ),
    const WishlistItem(
      id: 3,
      imageUrl:
          'https://thumbnail6.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/a193/10b096aa253e617aeeb4d249001cef90bc1ed4da9d11f3a152b4acfbdd03.jpg',
      title: '국산 운지버섯(구름버섯) 600g 건조 건 말린 한방 차 국내산',
      price: 102400,
    ),
  ];

  get wishlist => _wishlist;

  int _nextId = 4;

  void toggleWishlistItem(WishlistItem wishlistItem) {
    if (_wishlist.where((item) => item.id == wishlistItem.id).isEmpty) {
      _wishlist.add(wishlistItem);
    } else {
      _wishlist.removeWhere((item) => item.id == wishlistItem.id);
    }
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
        title: title,
        price: price,
      ),
    );
    notifyListeners();
  }

  bool isExist(int id) => _wishlist.any((item) => item.id == id);
}
