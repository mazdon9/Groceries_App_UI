import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';

abstract class IProductRepository {
  ResultFuture<void> deleteAProductInCart(int id);

  ResultFuture<ListOfCategoryProductsEntity> getShopProducts();

  ResultFuture<ProductsByCategoryEntity> getProductsByCategory(String category);

  ResultFuture<ProductDetailEntity> getProductById(int id);
}
