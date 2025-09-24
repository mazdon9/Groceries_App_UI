import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/entities/favorite_item_entity.dart';
import 'package:groceries_app/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class GetFavoriteProductsUsecase
    extends UsecaseAsync<ListOfFavoriteItemEntity, int> {
  final CartRepository _cartRepository;

  GetFavoriteProductsUsecase(this._cartRepository);

  @override
  ResultFuture<ListOfFavoriteItemEntity> call(int id) {
    return _cartRepository.getFavoriteProducts(id);
  }
}
