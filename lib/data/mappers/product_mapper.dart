import 'package:groceries_app/data/models/responses/product_dto.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';

/// Map single product
extension ProductMapper on ProductDto {
  ProductDetailEntity toEntity() {
    return ProductDetailEntity(
      id: id ?? 0,
      title: title ?? '',
      price: price ?? 0.0,
      thumbnail: thumbnail ?? '',
      weight: weight ?? 0,
    );
  }
}

extension ProductResponseMapper on ProductResponseDto {
  /// Group products by category -> ListOfCategoryProductsEntity
  ListOfCategoryProductsEntity toEntity() {
    final Map<String, List<ProductDetailEntity>> groupedProducts = {};

    final productList = products ?? [];

    for (final product in productList) {
      final categoryName = product.category ?? 'Other';
      final productEntity = product.toEntity();

      if (groupedProducts.containsKey(categoryName)) {
        groupedProducts[categoryName]!.add(productEntity);
      } else {
        groupedProducts[categoryName] = [productEntity];
      }
    }

    final listOfCategoryProducts = groupedProducts.entries
        .map(
          (entry) => CategoryProductsEntity(
            category: entry.key,
            products: entry.value,
          ),
        )
        .toList();

    return ListOfCategoryProductsEntity(
      listOfCategoryProductsEntity: listOfCategoryProducts,
    );
  }
}
