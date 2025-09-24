import 'package:equatable/equatable.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';

class CategoryState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final ProductsByCategoryEntity? productsByCategoryEntity;

  const CategoryState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.productsByCategoryEntity,
  });

  CategoryState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    ProductsByCategoryEntity? productsByCategoryEntity,
  }) {
    return CategoryState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      productsByCategoryEntity:
          productsByCategoryEntity ?? this.productsByCategoryEntity,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    apiErrorMessage,
    productsByCategoryEntity,
  ];
}
