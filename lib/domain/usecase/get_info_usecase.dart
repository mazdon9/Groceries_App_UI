import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/entities/user_info_entity.dart';
import 'package:groceries_app/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class GetInfoUsecase extends UsecaseAsync<UserInfoEntity, NoParams> {
  final AuthRepository _authRepository;

  GetInfoUsecase(this._authRepository);

  @override
  ResultFuture<UserInfoEntity> call(NoParams params) {
    return _authRepository.getUserInfo();
  }
}
