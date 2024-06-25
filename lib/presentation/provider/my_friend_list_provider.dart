import 'package:flutter/material.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend.dart';
import 'package:moya/domain/entities/friend_preview_entity.dart';
import 'package:moya/domain/usecases/add_friend_use_case.dart';
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

  Future<void> addFriend({
    required FriendPreview friendPreview,
  }) async {
    _friendList.add(
      Friend(
        profileImage: friendPreview.profileImage,
        name: friendPreview.name,
        isOpen: false,
      ),
    );
    notifyListeners();

    AddFriendUseCase useCase = serviceLocator<AddFriendUseCase>();
    final result = await useCase.call(friendId: friendPreview.id);
    result.when(
      success: (data) {
        fetch();
      },
      error: (message) {},
    );
  }
}
