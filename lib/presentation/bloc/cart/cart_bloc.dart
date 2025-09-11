import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/domain/usecase/delete_cart_usecase.dart';
import 'package:groceries_app/domain/usecase/get_cart_items_usecase.dart';
import 'package:groceries_app/domain/usecase/update_cart_item_quantity_usecase.dart';
import 'package:groceries_app/presentation/bloc/cart/cart_event.dart';
import 'package:groceries_app/presentation/bloc/cart/cart_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUsecase getCartItemsUsecase;
  final UpdateCartItemQuantityUsecase updateCartItemQuantityUsecase;
  final DeleteCartUsecase deleteCartUsecase;
  final FailureMapper failureMapper;

  CartBloc(
    this.getCartItemsUsecase,
    this.updateCartItemQuantityUsecase,
    this.deleteCartUsecase,
    this.failureMapper,
  ) : super(const CartState()) {
    on<OnGetCartItemsEvent>(_onGetCartItemsEvent);
    on<OnUpdateCartItemQuantityEvent>(_onUpdateCartItemQuantityEvent);
    on<OnDeleteCartEvent>(_onDeleteCartEvent);
    on<OnClearCartErrorMessage>(_onClearCartErrorMessage);
  }

  Future<void> _onGetCartItemsEvent(
    OnGetCartItemsEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await getCartItemsUsecase.call(event.cartId);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (data) {
          emit(state.copyWith(cartEntity: data));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiErrorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onUpdateCartItemQuantityEvent(
    OnUpdateCartItemQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final params = UpdateCartItemParams(
        cartId: event.cartId,
        productId: event.productId,
        quantity: event.quantity,
      );
      final result = await updateCartItemQuantityUsecase.call(params);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (data) {
          emit(state.copyWith(cartEntity: data));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiErrorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onDeleteCartEvent(
    OnDeleteCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await deleteCartUsecase.call(event.cartId);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (data) {
          emit(state.copyWith(cartEntity: data));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiErrorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onClearCartErrorMessage(
    OnClearCartErrorMessage event,
    Emitter<CartState> emit,
  ) {
    emit(state.copyWith(apiErrorMessage: ''));
  }
}
