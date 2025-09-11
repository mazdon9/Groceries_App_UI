import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/entities/cart_item_entity.dart';
import 'package:groceries_app/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class DeleteCartUsecase extends UsecaseAsync<CartEntity, int> {
  final CartRepository _cartRepository;

  DeleteCartUsecase(this._cartRepository);

  @override
  ResultFuture<CartEntity> call(int id) {
    return _cartRepository.deleteCart(id);
  }
}
