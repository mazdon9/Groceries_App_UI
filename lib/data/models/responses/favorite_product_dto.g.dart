// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProductDto _$FavoriteProductDtoFromJson(Map<String, dynamic> json) =>
    FavoriteProductDto(
      (json['id'] as num).toInt(),
      (json['total'] as num).toDouble(),
      (json['discountedTotal'] as num).toDouble(),
      (json['userId'] as num).toInt(),
      (json['totalProducts'] as num).toInt(),
      (json['totalQuantity'] as num).toInt(),
      (json['products'] as List<dynamic>)
          .map(
            (e) => FavoriteProductItemDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$FavoriteProductDtoToJson(FavoriteProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'discountedTotal': instance.discountedTotal,
      'userId': instance.userId,
      'totalProducts': instance.totalProducts,
      'totalQuantity': instance.totalQuantity,
      'products': instance.products,
    };

FavoriteProductItemDto _$FavoriteProductItemDtoFromJson(
  Map<String, dynamic> json,
) => FavoriteProductItemDto(
  (json['id'] as num).toInt(),
  json['title'] as String,
  (json['price'] as num).toDouble(),
  (json['quantity'] as num).toInt(),
  (json['total'] as num).toDouble(),
  (json['discountPercentage'] as num).toDouble(),
  (json['discountedTotal'] as num).toDouble(),
  json['thumbnail'] as String,
);

Map<String, dynamic> _$FavoriteProductItemDtoToJson(
  FavoriteProductItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': instance.price,
  'quantity': instance.quantity,
  'total': instance.total,
  'discountPercentage': instance.discountPercentage,
  'discountedTotal': instance.discountedTotal,
  'thumbnail': instance.thumbnail,
};
