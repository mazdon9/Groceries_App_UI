import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/logging/app_logger.dart';
import 'package:groceries_app/data/datasources/local/local_storage.dart';
import 'package:groceries_app/data/models/requests/login_schema.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/usecase/login_usecase.dart';
import 'package:groceries_app/presentation/bloc/login/login_event.dart';
import 'package:groceries_app/presentation/bloc/login/login_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUsecase loginUsecase = getIt<LoginUsecase>();
  LocalStorage localStorage = getIt<LocalStorage>();
  FailureMapper failureMapper;

  LoginBloc(this.failureMapper) : super(LoginState()) {
    on<OnLoginEvent>((event, emit) async {
      await _onLoginEvent(event, emit);
    });
    on<OnTogglePasswordEvent>(_onTogglePasswordEvent);
    on<OnClearLoginErrorMessage>(_onClearLoginErrorMessage);
  }

  Future<void> _onLoginEvent(
    OnLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await loginUsecase.call(
        LoginSchema(
          username: event.username,
          password: event.password,
          expiresInMins: 30,
        ),
      );
      await result.fold(
        (failure) {
          emit(
            state.copyWith(
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (success) async {
          await localStorage.setAccessToken(success.accessToken);

          /// save refresh token
          final accessToken = localStorage.getAccessToken();
          getIt<AppLogger>().i(
            "accessToken",
            meta: {'accessToken': accessToken},
          );
          emit(state.copyWith(isSuccess: true));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiErrorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onTogglePasswordEvent(
    OnTogglePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isHidePassword: !state.isHidePassword));
  }

  void _onClearLoginErrorMessage(
    OnClearLoginErrorMessage event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(apiErrorMessage: ''));
  }
}
