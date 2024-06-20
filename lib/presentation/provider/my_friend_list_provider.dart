import 'package:flutter/material.dart';
import 'package:moya/domain/entities/friend.dart';

class MyFriendListProvider with ChangeNotifier {
  final List<Friend> _friendList = <Friend>[
    const Friend(
      id: 1,
      profileUrl: 'https://storage.surfit.io/user/avatar/1745610414.png',
      username: '이명재',
      isFunding: true,
    ),
    const Friend(
      id: 2,
      profileUrl: 'https://storage.surfit.io/user/avatar/1745610414.png',
      username: '조우성',
      isFunding: false,
    ),
    const Friend(
      id: 3,
      profileUrl: 'https://storage.surfit.io/user/avatar/1745610414.png',
      username: '신준서',
      isFunding: false,
    ),
    const Friend(
      id: 3,
      profileUrl: 'https://storage.surfit.io/user/avatar/1745610414.png',
      username: '한예준',
      isFunding: false,
    ),
  ];

  get friendList => _friendList;

  int _nextId = 4;

  void addFriend({
    required String profileUrl,
    required String username,
    required bool isFunding,
  }) {
    _friendList.add(
      Friend(
        id: _nextId++,
        profileUrl: profileUrl,
        username: username,
        isFunding: isFunding,
      ),
    );
    notifyListeners();
  }
}
