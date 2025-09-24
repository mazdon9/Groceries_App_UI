import 'package:equatable/equatable.dart';
import 'package:groceries_app/domain/entities/cart_item_entity.dart';

class CartState extends Equatable {
  final bool isLoading;
  final CartEntity? cartEntity;
  final String apiErrorMessage;

  const CartState({
    this.isLoading = false,
    this.cartEntity,
    this.apiErrorMessage = '',
  });

  CartState copyWith({
    bool? isLoading,
    CartEntity? cartEntity,
    String? apiErrorMessage,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      cartEntity: cartEntity ?? this.cartEntity,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, cartEntity, apiErrorMessage];
}
