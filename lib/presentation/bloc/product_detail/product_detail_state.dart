import 'package:equatable/equatable.dart';

class ProductDetailState extends Equatable {
  final bool isFavorite;
  final int quantity;
  final bool productDetailExpanded;
  final bool nutritionsExpanded;
  final bool reviewExpanded;

  const ProductDetailState({
    this.isFavorite = false,
    this.quantity = 1,
    this.productDetailExpanded = false,
    this.nutritionsExpanded = false,
    this.reviewExpanded = false,
  });

  ProductDetailState copyWith({
    bool? isFavorite,
    int? quantity,
    bool? productDetailExpanded,
    bool? nutritionsExpanded,
    bool? reviewExpanded,
  }) {
    return ProductDetailState(
      isFavorite: isFavorite ?? this.isFavorite,
      quantity: quantity ?? this.quantity,
      productDetailExpanded:
          productDetailExpanded ?? this.productDetailExpanded,
      nutritionsExpanded: nutritionsExpanded ?? this.nutritionsExpanded,
      reviewExpanded: reviewExpanded ?? this.reviewExpanded,
    );
  }

  @override
  List<Object?> get props => [
    isFavorite,
    quantity,
    productDetailExpanded,
    nutritionsExpanded,
    reviewExpanded,
  ];
}
