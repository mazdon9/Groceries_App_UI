import 'package:equatable/equatable.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object?> get props => [];
}

class ToggleFavorite extends ProductDetailEvent {}

class ChangeQuantity extends ProductDetailEvent {
  final int quantity;
  const ChangeQuantity(this.quantity);

  @override
  List<Object?> get props => [quantity];
}

class ToggleProductDetailExpanded extends ProductDetailEvent {}

class ToggleNutritionsExpanded extends ProductDetailEvent {}

class ToggleReviewExpanded extends ProductDetailEvent {}
