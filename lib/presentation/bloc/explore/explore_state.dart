import 'package:equatable/equatable.dart';
import 'package:groceries_app/domain/entities/category_entity.dart';

class ExploreState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final CategoriesListEntity? categoriesListEntity;
  final List<CategoryEntity> filteredCategories;
  final String searchQuery;

  const ExploreState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.categoriesListEntity,
    this.filteredCategories = const [],
    this.searchQuery = '',
  });

  ExploreState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    CategoriesListEntity? categoriesListEntity,
    List<CategoryEntity>? filteredCategories,
    String? searchQuery,
  }) {
    return ExploreState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      categoriesListEntity: categoriesListEntity ?? this.categoriesListEntity,
      filteredCategories: filteredCategories ?? this.filteredCategories,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    apiErrorMessage,
    categoriesListEntity,
    filteredCategories,
    searchQuery,
  ];
}
