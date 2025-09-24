import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class OnLoadProductsByCategoryEvent extends CategoryEvent {
  final String categoryName;

  const OnLoadProductsByCategoryEvent(this.categoryName);

  @override
  List<Object?> get props => [categoryName];
}

class OnClearCategoryErrorMessage extends CategoryEvent {
  const OnClearCategoryErrorMessage();
}
