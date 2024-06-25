import 'package:flutter/material.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend_fund_item.dart';
import 'package:moya/domain/usecases/get_friend_fund_list_use_case.dart';
import 'package:moya/domain/usecases/sponsor_use_case.dart';

class FriendFundListProvider with ChangeNotifier {
  List<FriendFundItem> _friendFundList = [];

  List<FriendFundItem> get friendFundList => _friendFundList;

  Future<void> fetch() async {
    GetFriendFundListUseCase useCase =
        serviceLocator<GetFriendFundListUseCase>();

    final result = await useCase.call();

    result.when(
      success: (friendFundList) {
        _friendFundList = friendFundList
            .map(
              (e) => FriendFundItem(
                id: e.id,
                name: e.name,
                productName: e.productName,
                moya: e.moya,
                targetMoya: e.targetMoya,
                imageUrl: e.imageUrl,
                finishedAt: e.finishedAt,
              ),
            )
            .toList();
      },
      error: (message) {},
    );

    notifyListeners();
  }

  Future<void> sponsorMoya({
    required int fundId,
    required int moyaAmount,
    required String content,
    required bool isVisible,
  }) async {
    SponsorUseCase useCase = serviceLocator<SponsorUseCase>();
    await useCase.call(
      fundId: fundId,
      moyaAmount: moyaAmount,
      content: content,
      isVisible: isVisible,
    );
    fetch();
  }
}
