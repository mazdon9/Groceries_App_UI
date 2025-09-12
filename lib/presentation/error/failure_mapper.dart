import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/data/datasources/local/local_storage.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/core/failures.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';

class FailureMapper {
  final BuildContext context;

  FailureMapper(this.context);

  String mapFailureToMessage(Failures failure) {
    switch (failure) {
      case NetworkFailure():
        return 'Network Error';
      case ServerFailure():
        return 'Server Error';
      case CacheFailure():
        return 'Cache Error';
      case UnauthorizedFailure():
        _navigateToLoginScreen();

        /// navigate to login screen
        return 'Unauthorized Error';
      case ForbiddenFailure():
        return 'Forbidden Error';
      case NoInternetConnectionFailure():
        return 'No Internet Connection Error';
      case UnknownFailure():
        return 'Unknown Error';
      default:
        return 'Unknown Failure';
    }
  }

  Future<void> _navigateToLoginScreen() async {
    await getIt<LocalStorage>().setAccessToken('');
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      context.go(RouteName.loginPath);
    });
  }
}
