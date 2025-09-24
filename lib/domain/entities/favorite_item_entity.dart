import 'package:equatable/equatable.dart';

// "products": [
//     {
//         "id": 168,
//         "title": "Charger SXT RWD",
//         "price": 32999.99,
//         "quantity": 3,
//         "total": 98999.97,
//         "discountPercentage": 13.39,
//         "discountedTotal": 85743.87,
//         "thumbnail": "https://cdn.dummyjson.com/products/images/vehicle/Charger%20SXT%20RWD/thumbnail.png"
//     },
// ],

class ListOfFavoriteItemEntity extends Equatable {
  final List<FavoriteItemEntity> items;

  const ListOfFavoriteItemEntity({required this.items});

  @override
  List<Object?> get props => [items];
}

class FavoriteItemEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String thumbnail;

  const FavoriteItemEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });

  @override
  List<Object?> get props => [id, title, price, thumbnail];
}
