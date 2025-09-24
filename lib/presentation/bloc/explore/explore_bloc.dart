import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/domain/repositories/category_repository.dart';
import 'package:groceries_app/presentation/bloc/explore/explore_event.dart';
import 'package:groceries_app/presentation/bloc/explore/explore_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final CategoryRepository _categoryRepository;

  ExploreBloc(this._categoryRepository) : super(const ExploreState()) {
    on<OnLoadCategoriesEvent>(_onLoadCategories);
    on<OnClearExploreErrorMessage>(_onClearErrorMessage);
    on<OnSearchCategoriesEvent>(_onSearchCategories);
  }

  Future<void> _onLoadCategories(
    OnLoadCategoriesEvent event,
    Emitter<ExploreState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final categoriesResult = await _categoryRepository.getCategoriesList();

      emit(
        state.copyWith(
          isLoading: false,
          categoriesListEntity: categoriesResult,
          filteredCategories: categoriesResult.categories,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, apiErrorMessage: e.toString()));
    }
  }

  void _onClearErrorMessage(
    OnClearExploreErrorMessage event,
    Emitter<ExploreState> emit,
  ) {
    emit(state.copyWith(apiErrorMessage: ''));
  }

  void _onSearchCategories(
    OnSearchCategoriesEvent event,
    Emitter<ExploreState> emit,
  ) {
    final searchQuery = event.searchQuery.toLowerCase().trim();

    if (state.categoriesListEntity?.categories != null) {
      if (searchQuery.isEmpty) {
        // If search query is empty, show all categories
        emit(
          state.copyWith(
            filteredCategories: state.categoriesListEntity!.categories,
            searchQuery: searchQuery,
          ),
        );
      } else {
        // Filter categories that contain the search query
        final filteredCategories = state.categoriesListEntity!.categories
            .where(
              (category) => category.name.toLowerCase().contains(searchQuery),
            )
            .toList();

        emit(
          state.copyWith(
            filteredCategories: filteredCategories,
            searchQuery: searchQuery,
          ),
        );
      }
    }
  }
}
