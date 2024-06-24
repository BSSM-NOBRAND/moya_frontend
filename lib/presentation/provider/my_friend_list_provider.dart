import 'package:flutter/material.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend.dart';
import 'package:moya/domain/usecases/get_friend_list_use_case.dart';

class MyFriendListProvider with ChangeNotifier {
  List<Friend> _friendList = <Friend>[];

  Future<void> fetch() async {
    GetFriendListUseCase useCase = serviceLocator<GetFriendListUseCase>();
    final result = await useCase.call();
    result.when(
      success: (friendList) {
        _friendList = friendList
            .map(
              (e) => Friend(
                profileImage: e.profileImage,
                name: e.name,
                isOpen: e.isOpen,
              ),
            )
            .toList();
      },
      error: (message) {},
    );
    notifyListeners();
  }

  List<Friend> get friendList => _friendList;

  void addFriend({
    required String profileUrl,
    required String username,
    required bool isFunding,
  }) {
    _friendList.add(
      Friend(
        profileImage: profileUrl,
        name: username,
        isOpen: isFunding,
      ),
    );
    notifyListeners();
  }
}
