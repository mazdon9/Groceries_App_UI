// {
//     "id": 1,
//     "products": [
//         {
//             "id": 168,
//             "title": "Charger SXT RWD",
//             "price": 32999.99,
//             "quantity": 3,
//             "total": 98999.97,
//             "discountPercentage": 13.39,
//             "discountedTotal": 85743.87,
//             "thumbnail": "https://cdn.dummyjson.com/products/images/vehicle/Charger%20SXT%20RWD/thumbnail.png"
//         },
//     ],
//     "total": 103774.85,
//     "discountedTotal": 89686.65,
//     "userId": 33,
//     "totalProducts": 4,
//     "totalQuantity": 15
// }

import 'package:json_annotation/json_annotation.dart';

part 'favorite_product_dto.g.dart';

/// DTO -> Data Transfer Object
/// String -> Json -> Model (object)
/// Model (Object) -> Json -> String
@JsonSerializable()
class FavoriteProductDto {
  final int id;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;
  final List<FavoriteProductItemDto> products;

  FavoriteProductDto(
    this.id,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
    this.products,
  );

  /// fromJson
  factory FavoriteProductDto.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductDtoFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$FavoriteProductDtoToJson(this);
}

@JsonSerializable()
class FavoriteProductItemDto {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  FavoriteProductItemDto(
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  );

  /// fromJson
  factory FavoriteProductItemDto.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductItemDtoFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$FavoriteProductItemDtoToJson(this);
}
