import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class OnGetCartItemsEvent extends CartEvent {
  final int cartId;

  const OnGetCartItemsEvent(this.cartId);

  @override
  List<Object?> get props => [cartId];
}

class OnUpdateCartItemQuantityEvent extends CartEvent {
  final int cartId;
  final int productId;
  final int quantity;

  const OnUpdateCartItemQuantityEvent({
    required this.cartId,
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [cartId, productId, quantity];
}

class OnDeleteCartEvent extends CartEvent {
  final int cartId;

  const OnDeleteCartEvent(this.cartId);

  @override
  List<Object?> get props => [cartId];
}

class OnClearCartErrorMessage extends CartEvent {
  const OnClearCartErrorMessage();
}
