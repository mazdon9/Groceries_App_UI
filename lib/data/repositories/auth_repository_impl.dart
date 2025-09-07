import 'package:groceries_app/data/core/guard.dart';
import 'package:groceries_app/data/datasources/remote/api_service.dart';
import 'package:groceries_app/data/mappers/login_mapper.dart';
import 'package:groceries_app/data/mappers/user_info_mapper.dart';
import 'package:groceries_app/data/models/requests/login_schema.dart';
import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/login_entity.dart';
import 'package:groceries_app/domain/entities/user_info_entity.dart';
import 'package:groceries_app/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  ResultFuture<LoginEntity> login(LoginSchema loginSchema) {
    return guardDio<LoginEntity>(() async {
      final responseDTO = await _apiService.login(loginSchema);
      return responseDTO.toEntity();
    });
  }

  @override
  ResultFuture<UserInfoEntity> getUserInfo() {
    return guardDio<UserInfoEntity>(() async {
      final responseDTO = await _apiService.getUserInfo();
      return responseDTO.toEntity();
    });
  }
}
