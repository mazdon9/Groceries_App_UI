import 'package:equatable/equatable.dart';

class ProductDetailEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String thumbnail;
  final int weight;

  const ProductDetailEntity({
    required this.id,
    required this.price,
    required this.thumbnail,
    required this.title,
    required this.weight,
  });

  @override
  List<Object?> get props => [id, price, thumbnail, title, weight];
}

class CategoryProductsEntity extends Equatable {
  final String category;
  final List<ProductDetailEntity> products;

  const CategoryProductsEntity({
    required this.products,
    required this.category,
  });

  @override
  List<Object?> get props => [products];
}

class ListOfCategoryProductsEntity extends Equatable {
  final List<CategoryProductsEntity> listOfCategoryProductsEntity;

  const ListOfCategoryProductsEntity({
    required this.listOfCategoryProductsEntity,
  });

  @override
  List<Object?> get props => [listOfCategoryProductsEntity];
}

class ProductsByCategoryEntity extends Equatable {
  final List<ProductDetailEntity> products;
  final int total;
  final int skip;
  final int limit;

  const ProductsByCategoryEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  @override
  List<Object?> get props => [products, total, skip, limit];
}
