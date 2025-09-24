import 'package:groceries_app/data/models/requests/login_schema.dart';
import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/login_entity.dart';
import 'package:groceries_app/domain/entities/user_info_entity.dart';

abstract class AuthRepository {
  ResultFuture<LoginEntity> login(LoginSchema loginSchema);

  ResultFuture<UserInfoEntity> getUserInfo();
}
