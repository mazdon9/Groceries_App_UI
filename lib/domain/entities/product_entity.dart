import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  const ReviewEntity({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  @override
  List<Object?> get props => [
    rating,
    comment,
    date,
    reviewerName,
    reviewerEmail,
  ];
}

class DimensionsEntity extends Equatable {
  final double width;
  final double height;
  final double depth;

  const DimensionsEntity({
    required this.width,
    required this.height,
    required this.depth,
  });

  @override
  List<Object?> get props => [width, height, depth];
}

class ProductDetailEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final DimensionsEntity dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ReviewEntity> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final String thumbnail;
  final List<String> images;

  const ProductDetailEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.thumbnail,
    required this.images,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    tags,
    brand,
    sku,
    weight,
    dimensions,
    warrantyInformation,
    shippingInformation,
    availabilityStatus,
    reviews,
    returnPolicy,
    minimumOrderQuantity,
    thumbnail,
    images,
  ];
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
