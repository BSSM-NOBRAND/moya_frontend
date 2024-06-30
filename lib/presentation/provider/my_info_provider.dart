import 'package:flutter/material.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/data/models/api_loading_state.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/user.dart';
import 'package:moya/domain/usecases/charge_moya_use_case.dart';
import 'package:moya/domain/usecases/exchange_moya_use_case.dart';
import 'package:moya/domain/usecases/get_user_use_case.dart';

class MyInfoProvider with ChangeNotifier {
  ApiLoadingState _state = ApiLoadingState(false);

  User user = const User(
      name: '',
      userId: '',
      moya: 0,
      mileage: 0,
      isOpen: false,
      profileImage: '');

  ApiLoadingState get state => _state;

  Future<Result> fetch() async {
    _state = state.copyWith(isLoading: true);
    GetUserUseCase useCase = serviceLocator<GetUserUseCase>();
    final result = await useCase.call();
    return result.when(
      success: (item) {
        user = item;
        print(item);
        notifyListeners();
        return Result.success(item);
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }

  Future<void> exchangeMoya() async {
    user = User(
      name: user.name,
      userId: user.userId,
      moya: user.moya + (user.mileage / 5000).floor(),
      mileage: user.mileage % 5000,
      isOpen: user.isOpen,
      profileImage: user.profileImage,
    );
    notifyListeners();

    ExchangeMoyaUseCase useCase = serviceLocator<ExchangeMoyaUseCase>();
    await useCase.call();
    fetch();
  }

  Future<void> chargeMoya() async {
    user = User(
      name: user.name,
      userId: user.userId,
      moya: user.moya + 20,
      mileage: user.mileage,
      isOpen: user.isOpen,
      profileImage: user.profileImage,
    );
    notifyListeners();

    ChargeMoyaUseCase useCase = serviceLocator<ChargeMoyaUseCase>();
    await useCase.call();
    fetch();
  }
}
