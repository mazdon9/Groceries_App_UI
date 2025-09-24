import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/usecase/get_all_products_usecase.dart';
import 'package:groceries_app/presentation/bloc/shop/shop_event.dart';
import 'package:groceries_app/presentation/bloc/shop/shop_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  GetAllProductsUsecase getShopProductsUsecase = getIt<GetAllProductsUsecase>();
  FailureMapper failureMapper;

  ShopBloc(this.failureMapper) : super(ShopState()) {
    on<OnGetShopProductsEvent>(_onGetShopProductsEvent);
    on<OnClearShopErrorMessage>(_onClearShopErrorMessage);
    add(OnGetShopProductsEvent());
  }

  Future<void> _onGetShopProductsEvent(
    OnGetShopProductsEvent event,
    Emitter<ShopState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await getShopProductsUsecase.call(NoParams());
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (success) {
          emit(state.copyWith(listOfCategoryProductsEntity: success));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiErrorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onClearShopErrorMessage(
    OnClearShopErrorMessage event,
    Emitter<ShopState> emit,
  ) {
    emit(state.copyWith(apiErrorMessage: ''));
  }
}
