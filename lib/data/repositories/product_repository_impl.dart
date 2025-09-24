import 'package:groceries_app/data/core/guard.dart';
import 'package:groceries_app/data/datasources/remote/api_service.dart';
import 'package:groceries_app/data/mappers/product_mapper.dart';
import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';
import 'package:groceries_app/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProductRepository)
class ProductRepositoryImpl implements IProductRepository {
  final ApiService apiService;

  ProductRepositoryImpl(this.apiService);

  @override
  ResultFuture<void> deleteAProductInCart(int id) {
    return guardDio<void>(() async {
      await apiService.deleteAProductInCart(id);
    });
  }

  @override
  ResultFuture<ListOfCategoryProductsEntity> getShopProducts() {
    return guardDio<ListOfCategoryProductsEntity>(() async {
      final responseDTO = await apiService.getAllProducts();
      return responseDTO.toEntity();
    });
  }

  @override
  ResultFuture<ProductsByCategoryEntity> getProductsByCategory(
    String category,
  ) {
    return guardDio<ProductsByCategoryEntity>(() async {
      final responseDTO = await apiService.getProductsByCategory(category);
      return responseDTO.toByCategoryEntity();
    });
  }
}
