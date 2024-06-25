import 'package:flutter/material.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/friend_fund_item.dart';
import 'package:moya/domain/usecases/get_friend_fund_list_use_case.dart';

class FriendFundListProvider with ChangeNotifier {
  List<FriendFundItem> _friendFundList = [
    const FriendFundItem(
      id: 1,
      username: '조우성',
      productName: '켈로그 팝타르트 프로스트 스트로베리, 384g, 1개',
      currentMoya: 1,
      maxMoya: 2,
      imageUrl:
          'https://thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/1c46/6070d09419b8197c5d4d0e7fd0bc2cafd18f47e54a80f2ca2592025512bc.jpg',
    ),
    const FriendFundItem(
      id: 2,
      username: '조우성',
      productName: '행복한댕냥이 고양이 숨숨집 하우스',
      currentMoya: 3,
      maxMoya: 4,
      imageUrl:
          'https://thumbnail10.coupangcdn.com/thumbnails/remote/492x492ex/image/retail/images/1644208474607669-5e1ffc52-6270-4c17-880a-fdde32758b92.png',
    ),
    const FriendFundItem(
      id: 3,
      username: '조우성',
      productName: '국산 운지버섯(구름버섯) 600g 건조 건 말린 한방 차 국내산',
      currentMoya: 12,
      maxMoya: 21,
      imageUrl:
          'https://thumbnail6.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/a193/10b096aa253e617aeeb4d249001cef90bc1ed4da9d11f3a152b4acfbdd03.jpg',
    )
  ];

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
                username: e.username,
                productName: e.productName,
                currentMoya: e.currentMoya,
                maxMoya: e.maxMoya,
                imageUrl: e.imageUrl,
              ),
            )
            .toList();
      },
      error: (message) {},
    );

    notifyListeners();
  }
}
