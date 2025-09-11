import 'package:groceries_app/data/core/guard.dart';
import 'package:groceries_app/data/datasources/remote/api_service.dart';
import 'package:groceries_app/data/mappers/list_of_favorite_items_mapper.dart';
import 'package:groceries_app/domain/core/result.dart';
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
}
