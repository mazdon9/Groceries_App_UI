import 'package:dio/dio.dart';
import 'package:groceries_app/core/logging/app_logger.dart';
import 'package:groceries_app/data/datasources/local/local_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkInterceptor extends Interceptor {
  NetworkInterceptor(this._localStorage, this._loggger);

  final LocalStorage _localStorage;
  final AppLogger _loggger;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _localStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    _loggger.t(
      'REQUEST ${options.method} ${options.uri}',
      meta: {
        'headers': options.headers,
        'query': options.queryParameters,
        'data': options.data,
      },
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _loggger.t(
      'RESPONSE [${response.statusCode}] ${response.requestOptions.uri}',
      meta: {'data': response.data},
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _loggger.e(
      'ERROR [${err.response?.statusCode}] ${err.requestOptions.uri}',
      meta: {'data': err.response?.data},
    );
    super.onError(err, handler);
  }
}
