import 'package:groceries_app/data/models/responses/favorite_product_dto.dart';
import 'package:groceries_app/domain/entities/favorite_item_entity.dart';

extension FavoriteItemEntityMapper on FavoriteProductDto {
  ListOfFavoriteItemEntity toEntity() {
    return ListOfFavoriteItemEntity(
      items: List.from(
        products.map(
          (product) => FavoriteItemEntity(
            id: product.id,
            title: product.title,
            thumbnail: product.thumbnail,
            price: product.price,
          ),
        ),
      ),
    );
  }
}
