import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/usecase/get_favorite_products_usecase.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_event.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  GetFavoriteProductsUsecase getFavoriteProductsUsecase =
      getIt<GetFavoriteProductsUsecase>();
  FailureMapper failureMapper;

  FavoriteBloc(this.failureMapper) : super(FavoriteState()) {
    on<OnGetFavoriteProductsEvent>(_onGetFavoriteProductsEvent);
    on<OnClearFavoriteErrorMessage>(_onClearFavoriteErrorMessage);
    add(OnGetFavoriteProductsEvent(1));
  }

  Future<void> _onGetFavoriteProductsEvent(
    OnGetFavoriteProductsEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await getFavoriteProductsUsecase.call(event.id);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (data) {
          emit(state.copyWith(listOfFavoriteItemEntity: data));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiErrorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onClearFavoriteErrorMessage(
    OnClearFavoriteErrorMessage event,
    Emitter<FavoriteState> emit,
  ) {
    emit(state.copyWith(apiErrorMessage: ''));
  }
}
