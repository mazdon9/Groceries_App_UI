import 'package:groceries_app/data/datasources/remote/api_service.dart';
import 'package:groceries_app/data/mappers/category_mapper.dart';
import 'package:groceries_app/domain/entities/category_entity.dart';
import 'package:groceries_app/domain/repositories/category_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final ApiService _apiService;

  CategoryRepositoryImpl(this._apiService);

  @override
  Future<CategoriesListEntity> getCategoriesList() async {
    try {
      final response = await _apiService.getCategoriesList();
      return CategoryMapper.fromStringList(response);
    } catch (e) {
      rethrow;
    }
  }
}
