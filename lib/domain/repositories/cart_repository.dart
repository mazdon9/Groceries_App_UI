import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/favorite_item_entity.dart';

abstract class CartRepository {
  ResultFuture<ListOfFavoriteItemEntity> getFavoriteProducts(int id);
}
