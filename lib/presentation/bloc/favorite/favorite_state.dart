import 'package:equatable/equatable.dart';
import 'package:groceries_app/domain/entities/favorite_item_entity.dart';

class FavoriteState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final ListOfFavoriteItemEntity? listOfFavoriteItemEntity;

  const FavoriteState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.listOfFavoriteItemEntity,
  });

  FavoriteState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    ListOfFavoriteItemEntity? listOfFavoriteItemEntity,
  }) {
    return FavoriteState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      listOfFavoriteItemEntity:
          listOfFavoriteItemEntity ?? this.listOfFavoriteItemEntity,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    apiErrorMessage,
    listOfFavoriteItemEntity,
  ];
}
