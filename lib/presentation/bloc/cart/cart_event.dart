import 'package:equatable/equatable.dart';
import 'package:groceries_app/data/models/params/update_cart_item_params.dart';

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
  final UpdateCartItemParams params;

  const OnUpdateCartItemQuantityEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class OnDeleteAProductInCartEvent extends CartEvent {
  final int productId;

  const OnDeleteAProductInCartEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class OnClearCartErrorMessage extends CartEvent {
  const OnClearCartErrorMessage();
}
