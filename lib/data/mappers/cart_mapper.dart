import 'package:groceries_app/data/models/responses/cart_dto.dart';
import 'package:groceries_app/domain/entities/cart_item_entity.dart';

extension CartEntityMapper on CartDto {
  CartEntity toEntity() {
    return CartEntity(
      id: id,
      products: products.map((item) => item.toEntity()).toList(),
      total: total,
      // discountedTotal: discountedTotal,
      // userId: userId,
      // totalProducts: totalProducts,
      // totalQuantity: totalQuantity,
    );
  }
}

extension CartItemEntityMapper on CartItemDto {
  CartItemEntity toEntity() {
    return CartItemEntity(
      id: id,
      title: title,
      price: price,
      quantity: quantity,
      // total: total,
      // discountPercentage: discountPercentage,
      // discountedTotal: discountedTotal,
      thumbnail: thumbnail,
    );
  }
}
