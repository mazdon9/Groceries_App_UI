import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/usecase/get_info_usecase.dart';
import 'package:groceries_app/presentation/bloc/account/account_event.dart';
import 'package:groceries_app/presentation/bloc/account/account_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  GetInfoUsecase getInfoUsecase = getIt<GetInfoUsecase>();
  FailureMapper failureMapper;

  AccountBloc(this.failureMapper) : super(AccountState()) {
    on<OnGetUserInfoAccountEvent>(_onGetUserInfoAccountEvent);
    on<OnClearAccountErrorMessage>(_onClearAccountErrorMessage);
    // add(OnGetUserInfoAccountEvent());
  }

  Future<void> _onGetUserInfoAccountEvent(
    OnGetUserInfoAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await getInfoUsecase.call(NoParams());
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (success) {
          emit(state.copyWith(userInfoEntity: success));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiErrorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onClearAccountErrorMessage(
    OnClearAccountErrorMessage event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(apiErrorMessage: ''));
  }
}
