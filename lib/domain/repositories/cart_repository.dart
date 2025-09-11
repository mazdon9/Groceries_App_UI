import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/cart_item_entity.dart';
import 'package:groceries_app/domain/entities/favorite_item_entity.dart';

abstract class CartRepository {
  ResultFuture<ListOfFavoriteItemEntity> getFavoriteProducts(int id);

  // New cart methods
  ResultFuture<CartEntity> getCartItems(int id);
  ResultFuture<CartEntity> updateCartItemQuantity(
    int cartId,
    int productId,
    int quantity,
  );
  ResultFuture<CartEntity> deleteCart(int id);
}
