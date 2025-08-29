// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:groceries_app/core/env/app_config.dart' as _i612;
import 'package:groceries_app/di/env_module.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final envModule = _$EnvModule();
    gh.singleton<_i612.AppConfig>(
      () => envModule.devConfig(),
      registerFor: {_dev},
    );
    gh.singleton<_i612.AppConfig>(
      () => envModule.stagingConfig(),
      registerFor: {_staging},
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
    return this;
  }
}

class _$EnvModule extends _i116.EnvModule {}
