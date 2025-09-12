import 'package:groceries_app/data/models/params/update_cart_item_params.dart';
import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/entities/cart_item_entity.dart';
import 'package:groceries_app/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class UpdateCartItemQuantityUsecase
    extends UsecaseAsync<CartEntity, UpdateCartItemParams> {
  final CartRepository _cartRepository;

  UpdateCartItemQuantityUsecase(this._cartRepository);

  @override
  ResultFuture<CartEntity> call(UpdateCartItemParams params) {
    return _cartRepository.updateCartItemQuantity(params);
  }
}
