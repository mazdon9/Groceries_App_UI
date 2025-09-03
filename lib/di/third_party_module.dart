import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:groceries_app/core/env/app_config.dart';
import 'package:groceries_app/data/core/dio_logger.dart';
import 'package:groceries_app/data/core/interceptors.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ThirdPartyModule {
  Dio dio(
    AppConfig appConfig,
    @Named('baseUrl') String baseUrl,
    NetworkInterceptor networkInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    dio.interceptors.add(prettyDioLoggerInterceptor());
    dio.interceptors.addAll([networkInterceptor]);

    return dio;
  }

  @preResolve
  Future<SharedPreferences> sharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  FlutterSecureStorage secureStorage() {
    return FlutterSecureStorage();
  }
}
