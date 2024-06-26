import 'package:get_it/get_it.dart';
import 'package:moya/data/data_sources/add_friend_api.dart';
import 'package:moya/data/data_sources/add_wishlist_item_api.dart';
import 'package:moya/data/data_sources/charge_moya_api.dart';
import 'package:moya/data/data_sources/delete_fund_api.dart';
import 'package:moya/data/data_sources/delete_wishlist_item_api.dart';
import 'package:moya/data/data_sources/exchange_moya_api.dart';
import 'package:moya/data/data_sources/get_friend_fund_list_api.dart';
import 'package:moya/data/data_sources/get_friend_list_api.dart';
import 'package:moya/data/data_sources/get_friend_preview_api.dart';
import 'package:moya/data/data_sources/get_fund_api.dart';
import 'package:moya/data/data_sources/get_my_wishlist_api.dart';
import 'package:moya/data/data_sources/get_user_api.dart';
import 'package:moya/data/data_sources/get_wishlist_item_preview_api.dart';
import 'package:moya/data/data_sources/raise_fund_api.dart';
import 'package:moya/data/data_sources/settle_fund_api.dart';
import 'package:moya/data/data_sources/sponsor_api.dart';
import 'package:moya/data/repositories/add_friend_repository_impl.dart';
import 'package:moya/data/repositories/add_wishlist_item_repository_impl.dart';
import 'package:moya/data/repositories/charge_moya_repository_impl.dart';
import 'package:moya/data/repositories/delete_fund_repository_impl.dart';
import 'package:moya/data/repositories/delete_wishlist_item_repository_impl.dart';
import 'package:moya/data/repositories/exchange_moya_repository_impl.dart';
import 'package:moya/data/repositories/get_friend_fund_list_repository_impl.dart';
import 'package:moya/data/repositories/get_friend_list_repository_impl.dart';
import 'package:moya/data/repositories/get_friend_preview_repository_impl.dart';
import 'package:moya/data/repositories/get_fund_repository_impl.dart';
import 'package:moya/data/repositories/get_my_wishlist_repository_impl.dart';
import 'package:moya/data/repositories/get_user_repository_impl.dart';
import 'package:moya/data/repositories/get_wishlist_item_preview_repository_impl.dart';
import 'package:moya/data/repositories/raise_fund_repository_impl.dart';
import 'package:moya/data/repositories/settle_fund_repository_impl.dart';
import 'package:moya/data/repositories/sponsor_repository_impl.dart';
import 'package:moya/domain/repositories/add_friend_repository.dart';
import 'package:moya/domain/repositories/add_wishlist_item_repository.dart';
import 'package:moya/domain/repositories/charge_moya_repository.dart';
import 'package:moya/domain/repositories/delete_fund_repository.dart';
import 'package:moya/domain/repositories/delete_wishlist_item_repository.dart';
import 'package:moya/domain/repositories/exchange_moya_repository.dart';
import 'package:moya/domain/repositories/get_friend_fund_list_repository.dart';
import 'package:moya/domain/repositories/get_friend_list_repository.dart';
import 'package:moya/domain/repositories/get_friend_preview_repository.dart';
import 'package:moya/domain/repositories/get_fund_repository.dart';
import 'package:moya/domain/repositories/get_my_wishlist_repository.dart';
import 'package:moya/domain/repositories/get_user_repository.dart';
import 'package:moya/domain/repositories/get_wishlist_item_preview_repository.dart';
import 'package:moya/domain/repositories/raise_fund_repository.dart';
import 'package:moya/domain/repositories/settle_fund_repository.dart';
import 'package:moya/domain/repositories/sponsor_repository.dart';
import 'package:moya/domain/usecases/add_friend_use_case.dart';
import 'package:moya/domain/usecases/add_wishlist_item_use_case.dart';
import 'package:moya/domain/usecases/charge_moya_use_case.dart';
import 'package:moya/domain/usecases/delete_fund_use_case.dart';
import 'package:moya/domain/usecases/delete_wishlist_item_use_case.dart';
import 'package:moya/domain/usecases/exchange_moya_use_case.dart';
import 'package:moya/domain/usecases/get_friend_fund_list_use_case.dart';
import 'package:moya/domain/usecases/get_friend_list_use_case.dart';
import 'package:moya/domain/usecases/get_friend_preview_use_case.dart';
import 'package:moya/domain/usecases/get_fund_use_case.dart';
import 'package:moya/domain/usecases/get_user_use_case.dart';
import 'package:moya/domain/usecases/get_wishlist_item_preview_use_case.dart';
import 'package:moya/domain/usecases/get_wishlist_use_case.dart';
import 'package:moya/domain/usecases/raise_fund_use_case.dart';
import 'package:moya/domain/usecases/settle_fund_use_case.dart';
import 'package:moya/domain/usecases/sponsor_use_case.dart';

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
  serviceLocator.registerLazySingleton<GetFriendFundListApi>(
    () => GetFriendFundListApi(),
  );
  serviceLocator.registerLazySingleton<AddFriendApi>(
    () => AddFriendApi(),
  );
  serviceLocator.registerLazySingleton<GetFriendPreviewApi>(
    () => GetFriendPreviewApi(),
  );
  serviceLocator.registerLazySingleton<ChargeMoyaApi>(
    () => ChargeMoyaApi(),
  );
  serviceLocator.registerLazySingleton<ExchangeMoyaApi>(
    () => ExchangeMoyaApi(),
  );
  serviceLocator.registerLazySingleton<SponsorApi>(
    () => SponsorApi(),
  );
  serviceLocator.registerLazySingleton<SettleFundApi>(
    () => SettleFundApi(),
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
  serviceLocator.registerLazySingleton<GetFriendFundListRepository>(
    () => GetFriendFundListRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<AddFriendRepository>(
    () => AddFriendRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<GetFriendPreviewRepository>(
    () => GetFriendPreviewRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<ChargeMoyaRepository>(
    () => ChargeMoyaRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<ExchangeMoyaRepository>(
    () => ExchangeMoyaRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<SponsorRepository>(
    () => SponsorRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<SettleFundRepository>(
    () => SettleFundRepositoryImpl(),
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
  serviceLocator.registerLazySingleton<GetFriendFundListUseCase>(
    () => GetFriendFundListUseCase(),
  );
  serviceLocator.registerLazySingleton<AddFriendUseCase>(
    () => AddFriendUseCase(),
  );
  serviceLocator.registerLazySingleton<GetFriendPreviewUseCase>(
    () => GetFriendPreviewUseCase(),
  );
  serviceLocator.registerLazySingleton<ChargeMoyaUseCase>(
    () => ChargeMoyaUseCase(),
  );
  serviceLocator.registerLazySingleton<ExchangeMoyaUseCase>(
    () => ExchangeMoyaUseCase(),
  );
  serviceLocator.registerLazySingleton<SponsorUseCase>(
    () => SponsorUseCase(),
  );
  serviceLocator.registerLazySingleton<SettleFundUseCase>(
    () => SettleFundUseCase(),
  );
}
