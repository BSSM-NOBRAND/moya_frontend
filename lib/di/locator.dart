import 'package:get_it/get_it.dart';
import 'package:moya/data/data_sources/add_wishlist_item_api.dart';
import 'package:moya/data/data_sources/delete_wishlist_item_api.dart';
import 'package:moya/data/data_sources/my_wishlist_api.dart';
import 'package:moya/data/data_sources/wishlist_item_preview_api.dart';
import 'package:moya/data/repositories/add_wishlist_item_repository_impl.dart';
import 'package:moya/data/repositories/delete_wishlist_item_repository_impl.dart';
import 'package:moya/data/repositories/my_wishlist_repository_impl.dart';
import 'package:moya/data/repositories/wishlist_item_preview_repository_impl.dart';
import 'package:moya/domain/repositories/add_wishlist_item_repository.dart';
import 'package:moya/domain/repositories/delete_wishlist_item_repository.dart';
import 'package:moya/domain/repositories/my_wishlist_repository.dart';
import 'package:moya/domain/repositories/wishlist_item_preview_repository.dart';
import 'package:moya/domain/usecases/add_wishlist_item_use_case.dart';
import 'package:moya/domain/usecases/delete_wishlist_item_use_case.dart';
import 'package:moya/domain/usecases/get_wishlist_item_preview_use_case.dart';
import 'package:moya/domain/usecases/get_wishlist_use_case.dart';

final serviceLocator = GetIt.instance;
void initServiceLocator() {
  // Api
  serviceLocator.registerLazySingleton<MyWishlistApi>(
    () => MyWishlistApi(),
  );
  serviceLocator.registerLazySingleton<WishlistItemPreviewApi>(
    () => WishlistItemPreviewApi(),
  );
  serviceLocator.registerLazySingleton<AddWishlistItemApi>(
    () => AddWishlistItemApi(),
  );
  serviceLocator.registerLazySingleton<DeleteWishlistItemApi>(
    () => DeleteWishlistItemApi(),
  );

  // Repository
  serviceLocator.registerLazySingleton<MyWishlistRepository>(
    () => MyWishlistRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<WishlistItemPreviewRepository>(
    () => WishlistItemPreviewRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<AddWishlistItemRepository>(
    () => AddWishlistItemRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<DeleteWishlistItemRepository>(
    () => DeleteWishlistItemRepositoryImpl(),
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
}
