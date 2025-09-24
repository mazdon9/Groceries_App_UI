import 'package:groceries_app/domain/entities/category_entity.dart';

class CategoryMapper {
  static CategoryEntity fromString(String categoryName) {
    return CategoryEntity(name: categoryName);
  }

  static CategoriesListEntity fromStringList(List<String> categories) {
    return CategoriesListEntity(
      categories: categories.map((category) => fromString(category)).toList(),
    );
  }
}
