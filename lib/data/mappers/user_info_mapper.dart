import 'package:groceries_app/data/models/responses/user_info_dto.dart';
import 'package:groceries_app/domain/entities/user_info_entity.dart';

extension UserInfoMapper on UserInfoDto {
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      email: email ?? '---',
      id: id,
      fullName: '$firstName $lastName',
      image:
          image ??
          'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
    );
  }
}
