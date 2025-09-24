import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/domain/repositories/product_repository.dart';
import 'package:groceries_app/presentation/bloc/category/category_event.dart';
import 'package:groceries_app/presentation/bloc/category/category_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final IProductRepository _productRepository;

  CategoryBloc(this._productRepository) : super(const CategoryState()) {
    on<OnLoadProductsByCategoryEvent>(_onLoadProductsByCategory);
    on<OnClearCategoryErrorMessage>(_onClearErrorMessage);
  }

  Future<void> _onLoadProductsByCategory(
    OnLoadProductsByCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _productRepository.getProductsByCategory(
      event.categoryName,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, apiErrorMessage: failure.toString()),
      ),
      (productsByCategoryEntity) => emit(
        state.copyWith(
          isLoading: false,
          productsByCategoryEntity: productsByCategoryEntity,
        ),
      ),
    );
  }

  void _onClearErrorMessage(
    OnClearCategoryErrorMessage event,
    Emitter<CategoryState> emit,
  ) {
    emit(state.copyWith(apiErrorMessage: ''));
  }
}
