import 'package:equatable/equatable.dart';
import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/entities/cart_item_entity.dart';
import 'package:groceries_app/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

class UpdateCartItemParams extends Equatable {
  final int cartId;
  final int productId;
  final int quantity;

  const UpdateCartItemParams({
    required this.cartId,
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [cartId, productId, quantity];
}

@Injectable()
final class UpdateCartItemQuantityUsecase
    extends UsecaseAsync<CartEntity, UpdateCartItemParams> {
  final CartRepository _cartRepository;

  UpdateCartItemQuantityUsecase(this._cartRepository);

  @override
  ResultFuture<CartEntity> call(UpdateCartItemParams params) {
    return _cartRepository.updateCartItemQuantity(
      params.cartId,
      params.productId,
      params.quantity,
    );
  }
}
