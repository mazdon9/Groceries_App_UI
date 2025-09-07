import 'package:groceries_app/data/models/responses/login_dto.dart';
import 'package:groceries_app/domain/entities/login_entity.dart';

extension LoginMapper on LoginDto {
  LoginEntity toEntity() {
    return LoginEntity(
      email: email,
      id: id,
      fullName: '$firstName $lastName',
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
