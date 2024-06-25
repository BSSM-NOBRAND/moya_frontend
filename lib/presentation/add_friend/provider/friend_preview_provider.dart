import 'package:flutter/foundation.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend_preview_entity.dart';
import 'package:moya/domain/usecases/get_friend_preview_use_case.dart';

class FriendPreviewProvider with ChangeNotifier {
  FriendPreview? _friendPreview;

  FriendPreview? get friendPreview => _friendPreview;

  Future<void> fetch({required String userId}) async {
    GetFriendPreviewUseCase useCase = serviceLocator<GetFriendPreviewUseCase>();
    final result = await useCase.call(userId: userId);
    result.when(
      success: (previewEntity) {
        _friendPreview = previewEntity;
      },
      error: (message) {
        _friendPreview = null;
      },
    );
    notifyListeners();
  }

  void removeFriendPreview() {
    _friendPreview = null;
    notifyListeners();
  }
}
