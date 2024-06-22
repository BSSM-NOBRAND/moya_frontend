import 'package:get_it/get_it.dart';
import 'package:moya/data/data_sources/my_wishlist_api.dart';
import 'package:moya/data/repositories/my_wishlist_repository_impl.dart';
import 'package:moya/domain/repositories/my_wishlist_repository.dart';
import 'package:moya/domain/usecases/get_wishlist_use_case.dart';

final serviceLocator = GetIt.instance;
void initServiceLocator() {
  // Api
  serviceLocator.registerLazySingleton<MyWishlistApi>(
    () => MyWishlistApi(),
  );

  // Repository
  serviceLocator.registerLazySingleton<MyWishlistRepository>(
    () => MyWishlistRepositoryImpl(),
  );

  // UseCase
  serviceLocator.registerLazySingleton(
    () => GetWishlistUseCase(),
  );
}
