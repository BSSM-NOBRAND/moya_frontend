import 'package:flutter/material.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/domain/usecases/delete_fund_use_case.dart';
import 'package:moya/domain/usecases/get_fund_use_case.dart';
import 'package:moya/domain/usecases/raise_fund_use_case.dart';
import 'package:moya/domain/usecases/settle_fund_use_case.dart';
import 'package:moya/domain/usecases/verify_fund_use_case.dart';

enum FundStep { start, inProcess, ended, verify }

class FundStateProvider with ChangeNotifier {
  Fund _fund = const Fund(
    id: 0,
    name: '',
    imageUrl: '',
    price: 0,
    moya: 1,
    targetMoya: 1,
    finishedAt: '1592-05-23',
    state: '',
  );

  Fund get fund => _fund;

  void fetch() async {
    GetFundUseCase useCase = serviceLocator<GetFundUseCase>();
    final result = await useCase.call();
    result.when(
      success: (fund) {
        _fund = fund;
      },
      error: (message) {},
    );
    notifyListeners();
  }

  Future<void> raiseBirthFund(WishlistItem wishlistItem) async {
    RaiseFundUseCase useCase = serviceLocator<RaiseFundUseCase>();
    print(wishlistItem.id);
    final result = await useCase.call(id: wishlistItem.id);
    result.when(
      success: (s) {
        print(s);
        fetch();
      },
      error: (e) {},
    );
    notifyListeners();
  }

  Future<void> deleteFund() async {
    DeleteFundUseCase useCase = serviceLocator<DeleteFundUseCase>();
    final result = await useCase.call();
    result.when(
      success: (s) {
        fetch();
      },
      error: (message) {},
    );
  }

  Future<void> settleFund() async {
    SettleFundUseCase useCase = serviceLocator<SettleFundUseCase>();
    await useCase.call(fundId: _fund.id);
    fetch();
  }

  Future<void> verifyFund() async {
    VerifyFundUseCase useCase = serviceLocator<VerifyFundUseCase>();
    await useCase.call(fundId: _fund.id);
    fetch();
  }
}
