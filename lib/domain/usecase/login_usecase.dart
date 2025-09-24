import 'package:groceries_app/data/models/requests/login_schema.dart';
import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/entities/login_entity.dart';
import 'package:groceries_app/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class LoginUsecase extends UsecaseAsync<LoginEntity, LoginSchema> {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  @override
  ResultFuture<LoginEntity> call(LoginSchema params) {
    return _authRepository.login(params);
  }
}
