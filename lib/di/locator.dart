import 'package:get_it/get_it.dart';
import 'package:moya/data/data_sources/add_wishlist_item_api.dart';
import 'package:moya/data/data_sources/delete_fund_api.dart';
import 'package:moya/data/data_sources/delete_wishlist_item_api.dart';
import 'package:moya/data/data_sources/get_friend_list_api.dart';
import 'package:moya/data/data_sources/get_fund_api.dart';
import 'package:moya/data/data_sources/get_my_wishlist_api.dart';
import 'package:moya/data/data_sources/get_user_api.dart';
import 'package:moya/data/data_sources/get_wishlist_item_preview_api.dart';
import 'package:moya/data/data_sources/raise_fund_api.dart';
import 'package:moya/data/repositories/add_wishlist_item_repository_impl.dart';
import 'package:moya/data/repositories/delete_fund_repository_impl.dart';
import 'package:moya/data/repositories/delete_wishlist_item_repository_impl.dart';
import 'package:moya/data/repositories/get_friend_list_repository_impl.dart';
import 'package:moya/data/repositories/get_fund_repository_impl.dart';
import 'package:moya/data/repositories/get_my_wishlist_repository_impl.dart';
import 'package:moya/data/repositories/get_user_repository_impl.dart';
import 'package:moya/data/repositories/get_wishlist_item_preview_repository_impl.dart';
import 'package:moya/data/repositories/raise_fund_repository_impl.dart';
import 'package:moya/domain/repositories/add_wishlist_item_repository.dart';
import 'package:moya/domain/repositories/delete_fund_repository.dart';
import 'package:moya/domain/repositories/delete_wishlist_item_repository.dart';
import 'package:moya/domain/repositories/get_friend_list_repository.dart';
import 'package:moya/domain/repositories/get_fund_repository.dart';
import 'package:moya/domain/repositories/get_my_wishlist_repository.dart';
import 'package:moya/domain/repositories/get_user_repository.dart';
import 'package:moya/domain/repositories/get_wishlist_item_preview_repository.dart';
import 'package:moya/domain/repositories/raise_fund_repository.dart';
import 'package:moya/domain/usecases/add_wishlist_item_use_case.dart';
import 'package:moya/domain/usecases/delete_fund_use_case.dart';
import 'package:moya/domain/usecases/delete_wishlist_item_use_case.dart';
import 'package:moya/domain/usecases/get_friend_list_use_case.dart';
import 'package:moya/domain/usecases/get_fund_use_case.dart';
import 'package:moya/domain/usecases/get_user_use_case.dart';
import 'package:moya/domain/usecases/get_wishlist_item_preview_use_case.dart';
import 'package:moya/domain/usecases/get_wishlist_use_case.dart';
import 'package:moya/domain/usecases/raise_fund_use_case.dart';

final serviceLocator = GetIt.instance;
void initServiceLocator() {
  // Api
  serviceLocator.registerLazySingleton<GetMyWishlistApi>(
    () => GetMyWishlistApi(),
  );
  serviceLocator.registerLazySingleton<GetWishlistItemPreviewApi>(
    () => GetWishlistItemPreviewApi(),
  );
  serviceLocator.registerLazySingleton<AddWishlistItemApi>(
    () => AddWishlistItemApi(),
  );
  serviceLocator.registerLazySingleton<DeleteWishlistItemApi>(
    () => DeleteWishlistItemApi(),
  );
  serviceLocator.registerLazySingleton<GetUserApi>(
    () => GetUserApi(),
  );
  serviceLocator.registerLazySingleton<GetFundApi>(
    () => GetFundApi(),
  );
  serviceLocator.registerLazySingleton<RaiseFundApi>(
    () => RaiseFundApi(),
  );
  serviceLocator.registerLazySingleton<DeleteFundApi>(
    () => DeleteFundApi(),
  );
  serviceLocator.registerLazySingleton<GetFriendListApi>(
    () => GetFriendListApi(),
  );

  // Repository
  serviceLocator.registerLazySingleton<GetMyWishlistRepository>(
    () => GetMyWishlistRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<GetWishlistItemPreviewRepository>(
    () => GetWishlistItemPreviewRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<AddWishlistItemRepository>(
    () => AddWishlistItemRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<DeleteWishlistItemRepository>(
    () => DeleteWishlistItemRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<GetUserRepository>(
    () => GetUserRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<GetFundRepository>(
    () => GetFundRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<RaiseFundRepository>(
    () => RaiseFundRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<DeleteFundRepository>(
    () => DeleteFundRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<GetFriendListRepository>(
    () => GetFriendListRepositoryImpl(),
  );

  // UseCase
  serviceLocator.registerLazySingleton<GetWishlistUseCase>(
    () => GetWishlistUseCase(),
  );
  serviceLocator.registerLazySingleton<GetWishlistItemPreviewUseCase>(
    () => GetWishlistItemPreviewUseCase(),
  );
  serviceLocator.registerLazySingleton<AddWishlistItemUseCase>(
    () => AddWishlistItemUseCase(),
  );
  serviceLocator.registerLazySingleton<DeleteWishlistItemUseCase>(
    () => DeleteWishlistItemUseCase(),
  );
  serviceLocator.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(),
  );
  serviceLocator.registerLazySingleton<GetFundUseCase>(
    () => GetFundUseCase(),
  );
  serviceLocator.registerLazySingleton<RaiseFundUseCase>(
    () => RaiseFundUseCase(),
  );
  serviceLocator.registerLazySingleton<DeleteFundUseCase>(
    () => DeleteFundUseCase(),
  );
  serviceLocator.registerLazySingleton<GetFriendListUseCase>(
    () => GetFriendListUseCase(),
  );
}
