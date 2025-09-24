import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String name;

  const CategoryEntity({required this.name});

  @override
  List<Object> get props => [name];
}

class CategoriesListEntity extends Equatable {
  final List<CategoryEntity> categories;

  const CategoriesListEntity({required this.categories});

  @override
  List<Object> get props => [categories];
}
