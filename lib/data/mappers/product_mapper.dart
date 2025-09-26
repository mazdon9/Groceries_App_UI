import 'package:groceries_app/data/models/responses/product_dto.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';

/// Map single product
extension ProductMapper on ProductDto {
  ProductDetailEntity toEntity() {
    return ProductDetailEntity(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      category: category ?? '',
      price: price ?? 0.0,
      discountPercentage: discountPercentage ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      tags: tags ?? [],
      brand: brand ?? '',
      sku: sku ?? '',
      weight: weight ?? 0,
      dimensions:
          dimensions?.toDimensionsEntity() ??
          const DimensionsEntity(width: 0, height: 0, depth: 0),
      warrantyInformation: warrantyInformation ?? '',
      shippingInformation: shippingInformation ?? '',
      availabilityStatus: availabilityStatus ?? '',
      reviews: reviews?.map((review) => review.toReviewEntity()).toList() ?? [],
      returnPolicy: returnPolicy ?? '',
      minimumOrderQuantity: minimumOrderQuantity ?? 1,
      thumbnail: thumbnail ?? '',
      images: images ?? [],
    );
  }

  /// Map full product detail with all fields
  ProductDetailEntity toDetailEntity() {
    return ProductDetailEntity(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      category: category ?? '',
      price: price ?? 0.0,
      discountPercentage: discountPercentage ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      tags: tags ?? [],
      brand: brand ?? '',
      sku: sku ?? '',
      weight: weight ?? 0,
      dimensions:
          dimensions?.toDimensionsEntity() ??
          const DimensionsEntity(width: 0, height: 0, depth: 0),
      warrantyInformation: warrantyInformation ?? '',
      shippingInformation: shippingInformation ?? '',
      availabilityStatus: availabilityStatus ?? '',
      reviews: reviews?.map((review) => review.toReviewEntity()).toList() ?? [],
      returnPolicy: returnPolicy ?? '',
      minimumOrderQuantity: minimumOrderQuantity ?? 1,
      thumbnail: thumbnail ?? '',
      images: images ?? [],
    );
  }
}

extension DimensionsMapper on DimensionsDto {
  DimensionsEntity toDimensionsEntity() {
    return DimensionsEntity(
      width: width ?? 0.0,
      height: height ?? 0.0,
      depth: depth ?? 0.0,
    );
  }
}

extension ReviewMapper on ReviewDto {
  ReviewEntity toReviewEntity() {
    return ReviewEntity(
      rating: rating ?? 0,
      comment: comment ?? '',
      date: date ?? '',
      reviewerName: reviewerName ?? '',
      reviewerEmail: reviewerEmail ?? '',
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

  /// Map products by category response -> ProductsByCategoryEntity
  ProductsByCategoryEntity toByCategoryEntity() {
    final productList = products ?? [];

    final productEntities = productList
        .map((product) => product.toEntity())
        .toList();

    return ProductsByCategoryEntity(
      products: productEntities,
      total: total ?? 0,
      skip: skip ?? 0,
      limit: limit ?? 0,
    );
  }
}
