// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:groceries_app/core/env/app_config.dart' as _i612;
import 'package:groceries_app/core/logging/app_logger.dart' as _i95;
import 'package:groceries_app/core/logging/console_app_logger.dart' as _i697;
import 'package:groceries_app/data/core/interceptors.dart' as _i122;
import 'package:groceries_app/data/datasources/local/local_storage.dart'
    as _i154;
import 'package:groceries_app/data/datasources/remote/api_service.dart'
    as _i138;
import 'package:groceries_app/data/repositories/auth_repository_impl.dart'
    as _i774;
import 'package:groceries_app/data/repositories/cart_repository_impl.dart'
    as _i353;
import 'package:groceries_app/data/repositories/category_repository_impl.dart'
    as _i619;
import 'package:groceries_app/data/repositories/product_repository_impl.dart'
    as _i1032;
import 'package:groceries_app/di/env_module.dart' as _i116;
import 'package:groceries_app/di/third_party_module.dart' as _i202;
import 'package:groceries_app/domain/repositories/auth_repository.dart'
    as _i345;
import 'package:groceries_app/domain/repositories/cart_repository.dart'
    as _i909;
import 'package:groceries_app/domain/repositories/category_repository.dart'
    as _i172;
import 'package:groceries_app/domain/repositories/product_repository.dart'
    as _i85;
import 'package:groceries_app/domain/usecase/delete_a_product_in_cart_usecase.dart'
    as _i521;
import 'package:groceries_app/domain/usecase/delete_cart_usecase.dart' as _i192;
import 'package:groceries_app/domain/usecase/get_all_products_usecase.dart'
    as _i1007;
import 'package:groceries_app/domain/usecase/get_cart_items_usecase.dart'
    as _i124;
import 'package:groceries_app/domain/usecase/get_favorite_products_usecase.dart'
    as _i368;
import 'package:groceries_app/domain/usecase/get_info_usecase.dart' as _i84;
import 'package:groceries_app/domain/usecase/login_usecase.dart' as _i304;
import 'package:groceries_app/domain/usecase/update_cart_item_quantity_usecase.dart'
    as _i535;
import 'package:groceries_app/presentation/bloc/category/category_bloc.dart'
    as _i212;
import 'package:groceries_app/presentation/bloc/detail/detail_bloc.dart'
    as _i311;
import 'package:groceries_app/presentation/bloc/explore/explore_bloc.dart'
    as _i818;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyModule = _$ThirdPartyModule();
    final envModule = _$EnvModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => thirdPartyModule.sharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i558.FlutterSecureStorage>(
      () => thirdPartyModule.secureStorage(),
    );
    gh.singleton<_i612.AppConfig>(
      () => envModule.devConfig(),
      registerFor: {_dev},
    );
    gh.singleton<_i612.AppConfig>(
      () => envModule.stagingConfig(),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i95.AppLogger>(() => _i697.ConsoleAppLogger());
    gh.singleton<_i154.LocalStorage>(
      () => _i154.LocalStorage(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i122.NetworkInterceptor>(
      () => _i122.NetworkInterceptor(
        gh<_i154.LocalStorage>(),
        gh<_i95.AppLogger>(),
      ),
    );
    gh.singleton<_i612.AppConfig>(
      () => envModule.prodConfig(),
      registerFor: {_prod},
    );
    gh.singleton<String>(
      () => envModule.stagingBaseUrl(gh<_i612.AppConfig>()),
      instanceName: 'baseUrl',
      registerFor: {_staging},
    );
    gh.singleton<String>(
      () => envModule.devBaseUrl(gh<_i612.AppConfig>()),
      instanceName: 'baseUrl',
      registerFor: {_dev},
    );
    gh.singleton<String>(
      () => envModule.prodBaseUrl(gh<_i612.AppConfig>()),
      instanceName: 'baseUrl',
      registerFor: {_prod},
    );
    gh.factory<_i361.Dio>(
      () => thirdPartyModule.dio(
        gh<_i612.AppConfig>(),
        gh<String>(instanceName: 'baseUrl'),
        gh<_i122.NetworkInterceptor>(),
      ),
    );
    gh.lazySingleton<_i138.ApiService>(() => _i138.ApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i85.IProductRepository>(
      () => _i1032.ProductRepositoryImpl(gh<_i138.ApiService>()),
    );
    gh.lazySingleton<_i172.CategoryRepository>(
      () => _i619.CategoryRepositoryImpl(gh<_i138.ApiService>()),
    );
    gh.factory<_i521.DeleteAProductInCartUsecase>(
      () => _i521.DeleteAProductInCartUsecase(gh<_i85.IProductRepository>()),
    );
    gh.factory<_i818.ExploreBloc>(
      () => _i818.ExploreBloc(gh<_i172.CategoryRepository>()),
    );
    gh.lazySingleton<_i345.AuthRepository>(
      () => _i774.AuthRepositoryImpl(gh<_i138.ApiService>()),
    );
    gh.factory<_i1007.GetAllProductsUsecase>(
      () => _i1007.GetAllProductsUsecase(gh<_i85.IProductRepository>()),
    );
    gh.factory<_i212.CategoryBloc>(
      () => _i212.CategoryBloc(gh<_i85.IProductRepository>()),
    );
    gh.factory<_i311.DetailBloc>(
      () => _i311.DetailBloc(gh<_i85.IProductRepository>()),
    );
    gh.lazySingleton<_i909.CartRepository>(
      () => _i353.CartRepositoryImpl(gh<_i138.ApiService>()),
    );
    gh.factory<_i84.GetInfoUsecase>(
      () => _i84.GetInfoUsecase(gh<_i345.AuthRepository>()),
    );
    gh.factory<_i304.LoginUsecase>(
      () => _i304.LoginUsecase(gh<_i345.AuthRepository>()),
    );
    gh.factory<_i192.DeleteCartUsecase>(
      () => _i192.DeleteCartUsecase(gh<_i909.CartRepository>()),
    );
    gh.factory<_i124.GetCartItemsUsecase>(
      () => _i124.GetCartItemsUsecase(gh<_i909.CartRepository>()),
    );
    gh.factory<_i368.GetFavoriteProductsUsecase>(
      () => _i368.GetFavoriteProductsUsecase(gh<_i909.CartRepository>()),
    );
    gh.factory<_i535.UpdateCartItemQuantityUsecase>(
      () => _i535.UpdateCartItemQuantityUsecase(gh<_i909.CartRepository>()),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i202.ThirdPartyModule {}

class _$EnvModule extends _i116.EnvModule {}
