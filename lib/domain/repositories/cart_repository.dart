import 'package:groceries_app/data/models/params/update_cart_item_params.dart';
import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/cart_item_entity.dart';
import 'package:groceries_app/domain/entities/favorite_item_entity.dart';

abstract class CartRepository {
  ResultFuture<ListOfFavoriteItemEntity> getFavoriteProducts(int id);

  // New cart methods
  ResultFuture<CartEntity> getCartItems(int id);
  ResultFuture<CartEntity> updateCartItemQuantity(UpdateCartItemParams params);
  ResultFuture<CartEntity> deleteCart(int id);
}
