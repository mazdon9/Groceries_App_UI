import 'package:groceries_app/data/core/guard.dart';
import 'package:groceries_app/data/datasources/remote/api_service.dart';
import 'package:groceries_app/data/mappers/cart_mapper.dart';
import 'package:groceries_app/data/mappers/list_of_favorite_items_mapper.dart';
import 'package:groceries_app/data/models/params/update_cart_item_params.dart';
import 'package:groceries_app/data/models/requests/update_a_cart_schema.dart';
import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/cart_item_entity.dart';
import 'package:groceries_app/domain/entities/favorite_item_entity.dart';
import 'package:groceries_app/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final ApiService _apiService;

  CartRepositoryImpl(this._apiService);

  @override
  ResultFuture<ListOfFavoriteItemEntity> getFavoriteProducts(int id) {
    return guardDio<ListOfFavoriteItemEntity>(() async {
      final responseDTO = await _apiService.getFavoriteProducts(id);
      return responseDTO.toEntity();
    });
  }

  @override
  ResultFuture<CartEntity> getCartItems(int id) {
    return guardDio<CartEntity>(() async {
      final responseDTO = await _apiService.getCartItems(id);
      return responseDTO.toEntity();
    });
  }

  @override
  ResultFuture<CartEntity> updateCartItemQuantity(UpdateCartItemParams params) {
    return guardDio<CartEntity>(() async {
      final request = UpdateACartSchema(
        merge: true,
        products: [
          UpdateACartItemSchema(
            id: params.productId,
            quantity: params.quantity,
          ),
        ],
      );
      final responseDTO = await _apiService.updateCart(params.cartId, request);
      return responseDTO.toEntity();
    });
  }

  @override
  ResultFuture<CartEntity> deleteCart(int id) {
    return guardDio<CartEntity>(() async {
      final responseDTO = await _apiService.deleteCart(id);
      return responseDTO.toEntity();
    });
  }
}
