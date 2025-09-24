import 'package:equatable/equatable.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class OnLoadCategoriesEvent extends ExploreEvent {
  const OnLoadCategoriesEvent();
}

class OnClearExploreErrorMessage extends ExploreEvent {
  const OnClearExploreErrorMessage();
}

class OnSearchCategoriesEvent extends ExploreEvent {
  final String searchQuery;

  const OnSearchCategoriesEvent(this.searchQuery);

  @override
  List<Object> get props => [searchQuery];
}
