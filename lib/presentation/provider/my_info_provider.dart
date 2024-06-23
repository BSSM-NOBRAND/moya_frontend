import 'package:flutter/material.dart';
import 'package:moya/data/models/api_loading_state.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/user.dart';
import 'package:moya/domain/usecases/get_user_use_case.dart';

class MyInfoProvider with ChangeNotifier {
  ApiLoadingState _state = ApiLoadingState(false);

  User user = const User(
    name: '',
    userId: '',
    moya: 0,
    mileage: 0,
  );

  ApiLoadingState get state => _state;

  int _myMoya = 12;
  int _myMileage = 12000;

  int get myMoya => _myMoya;
  int get myMileage => _myMileage;

  void fetch() async {
    _state = state.copyWith(isLoading: true);
    GetUserUseCase useCase = serviceLocator<GetUserUseCase>();
    final result = await useCase.call();
    result.when(
      success: (item) {
        user = item;
      },
      error: (e) {},
    );
    notifyListeners();
  }

  void exchangeMileage() {
    _myMoya += (_myMileage / 5000).floor();
    _myMileage %= 5000;
    notifyListeners();
  }
}
