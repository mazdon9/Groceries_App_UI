import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/entities/cart_item_entity.dart';
import 'package:groceries_app/domain/usecase/delete_a_product_in_cart_usecase.dart';
import 'package:groceries_app/domain/usecase/get_cart_items_usecase.dart';
import 'package:groceries_app/domain/usecase/update_cart_item_quantity_usecase.dart';
import 'package:groceries_app/presentation/bloc/cart/cart_event.dart';
import 'package:groceries_app/presentation/bloc/cart/cart_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUsecase getCartItemsUsecase = getIt<GetCartItemsUsecase>();
  final UpdateCartItemQuantityUsecase updateCartItemQuantityUsecase =
      getIt<UpdateCartItemQuantityUsecase>();
  final DeleteAProductInCartUsecase deleteAProductInCartUsecase =
      getIt<DeleteAProductInCartUsecase>();

  final FailureMapper failureMapper;

  CartBloc(this.failureMapper) : super(const CartState()) {
    on<OnGetCartItemsEvent>(_onGetCartItemsEvent);
    on<OnUpdateCartItemQuantityEvent>(_onUpdateCartItemQuantityEvent);
    on<OnDeleteAProductInCartEvent>(_onDeleteAProductInCartEvent);
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
      final result = await updateCartItemQuantityUsecase.call(event.params);
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

  Future<void> _onDeleteAProductInCartEvent(
    OnDeleteAProductInCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await deleteAProductInCartUsecase.call(event.productId);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (data) {
          /// remove a product in cart with productId
          if (state.cartEntity != null) {
            /// Update exsiting cartEntity after remove deleled product
            final newProducts = state.cartEntity!.products
                .where((e) => e.id != event.productId)
                .toList();

            emit(
              state.copyWith(
                cartEntity: CartEntity(
                  id: state.cartEntity!.id,
                  products: newProducts,
                  total: state.cartEntity!.total,
                ),
              ),
            );
          }
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
