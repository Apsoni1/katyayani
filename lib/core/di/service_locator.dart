import 'package:katyayani/core/networking/network_service.dart';
import 'package:katyayani/feature/product_detail/data/data_source/product_item_detail_remote_data_source.dart';
import 'package:katyayani/feature/product_detail/data/repo_impl/product_item_detail_repo_impl.dart';
import 'package:katyayani/feature/product_detail/domain/repo/product_item_detail_repo.dart';
import 'package:katyayani/feature/product_detail/domain/usecase/get_product_item_detail.dart';
import 'package:katyayani/feature/product_detail/presentation/bloc/product_item_detail_bloc.dart';
import 'package:katyayani/feature/product_listing/data/data_source/product_list_remote_data_source.dart';
import 'package:katyayani/feature/product_listing/data/repo_impl/product_list_repo_impl.dart';
import 'package:katyayani/feature/product_listing/domain/repo/product_list_repo.dart';
import 'package:katyayani/feature/product_listing/domain/usecase/get_all_products_list.dart';
import 'package:katyayani/feature/product_listing/presentation/bloc/products_list_bloc.dart';
import 'package:katyayani/feature/settings/data/data_sources/settings_local_datasource.dart';
import 'package:katyayani/feature/settings/data/repositories/settings_repo_impl.dart';
import 'package:katyayani/feature/settings/domain/repositories/settings_repo.dart';
import 'package:katyayani/feature/settings/domain/use_cases/settings_usecase.dart';
import 'package:katyayani/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:katyayani/feature/user_profile/data/data_source/user_profile_local_data_source.dart';
import 'package:katyayani/feature/user_profile/data/repo_impl/user_profile_repo_impl.dart';
import 'package:katyayani/feature/user_profile/domain/repo/user_profile_repo.dart';
import 'package:katyayani/feature/user_profile/domain/usecase/user_profile_usecase.dart';
import 'package:katyayani/feature/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:katyayani/feature/wishlist/data/data_sources/wishlist_local_datasource.dart';
import 'package:katyayani/feature/wishlist/data/repositories/wishlist_repo_impl.dart';
import 'package:katyayani/feature/wishlist/domain/repositories/wishlist_repo.dart';
import 'package:katyayani/feature/wishlist/domain/use_cases/wishlist_usecase.dart';
import 'package:katyayani/feature/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:get_it/get_it.dart';

class AppInjector {
  static final GetIt injector = GetIt.instance;

  static Future<void> setupInjector() async {
    injector
      ..registerLazySingleton<NetworkService>(() => NetworkService())

      //datasource
      ..registerLazySingleton<ProductListRemoteDataSource>(
        () => ProductListRemoteDataSourceImpl(
          networkService: injector<NetworkService>(),
        ),
      )
      ..registerLazySingleton<ProductItemDetailRemoteDataSource>(
        () => ProductItemDetailRemoteDataSourceImpl(
          networkService: injector<NetworkService>(),


        ),
      )
      ..registerLazySingleton<UserProfileLocalDataSource>(
        () => UserProfileLocalDataSourceImpl(),
      ) // add tear off lint and check
      ..registerLazySingleton<SettingsLocalDataSource>(
        () => SettingsLocalDataSourceImpl(),
      )
      ..registerLazySingleton<WishListLocalDataSource>(
        () => WishListLocalDataSourceImpl(),
      )

      //repo
      ..registerLazySingleton<ProductListRepo>(
        () => ProductListRepoImpl(
          productListRemoteDataSource: injector<ProductListRemoteDataSource>(),
        ),
      )
      ..registerLazySingleton<ProductItemDetailRepo>(
        () => ProductItemDetailRepoImpl(
          productItemDetailRemoteDataSource:
              injector<ProductItemDetailRemoteDataSource>(),
        ),
      )
      ..registerLazySingleton<UserProfileRepo>(
        () => UserProfileRepoImpl(
          localDataSource: injector<UserProfileLocalDataSource>(),
        ),
      )
      ..registerLazySingleton<SettingsRepo>(
        () => SettingsRepoImpl(
          settingsLocalDataSource: injector<SettingsLocalDataSource>(),
        ),
      )
      ..registerLazySingleton<WishListRepo>(
        () => WishlistRepoImpl(
          wishListLocalDataSource: injector<WishListLocalDataSource>(),
        ),
      )

      //useCase
      ..registerLazySingleton<GetAllProductsList>(
        () => GetAllProductsList(productListRepo: injector<ProductListRepo>()),
      )
      ..registerLazySingleton<GetProductItemDetail>(
        () => GetProductItemDetail(
            productItemDetailRepo: injector<ProductItemDetailRepo>()),
      )
      ..registerLazySingleton<UserProfileUseCase>(
        () => UserProfileUseCase(repo: injector<UserProfileRepo>()),
      )
      ..registerLazySingleton<SettingsUseCase>(
        () => SettingsUseCase(repository: injector<SettingsRepo>()),
      )
      ..registerLazySingleton<WishlistUseCase>(
        () => WishlistUseCase(wishlistRepo: injector<WishListRepo>()),
      )

      //bloc
      ..registerFactory<ProductsListBloc>(
        () => ProductsListBloc(getAllProductsList: injector<GetAllProductsList>()),
      )
      ..registerFactory<ProductItemDetailBloc>(
        () => ProductItemDetailBloc(
            getProductItemDetail: injector<GetProductItemDetail>()),
      )
      ..registerFactory<UserProfileBloc>(
        () =>
            UserProfileBloc(userProfileUseCase: injector<UserProfileUseCase>()),
      )
      ..registerFactory<SettingsBloc>(
        () => SettingsBloc(settingsUseCase: injector<SettingsUseCase>()),
      )
      ..registerFactory<WishlistBloc>(
        () => WishlistBloc(wishlistUseCase: injector<WishlistUseCase>()),
      );
  }
}
