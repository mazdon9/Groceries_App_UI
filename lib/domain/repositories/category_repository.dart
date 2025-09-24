import 'package:groceries_app/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<CategoriesListEntity> getCategoriesList();
}
