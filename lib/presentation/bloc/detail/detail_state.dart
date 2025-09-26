import 'package:equatable/equatable.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';

class DetailState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final ProductDetailEntity? productDetailEntity;

  const DetailState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.productDetailEntity,
  });

  DetailState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    ProductDetailEntity? productDetailEntity,
  }) {
    return DetailState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      productDetailEntity: productDetailEntity ?? this.productDetailEntity,
    );
  }

  @override
  List<Object?> get props => [isLoading, apiErrorMessage, productDetailEntity];
}
