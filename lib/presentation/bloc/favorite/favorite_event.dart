abstract class FavoriteEvent {}

class OnGetFavoriteProductsEvent extends FavoriteEvent {
  final int id;

  OnGetFavoriteProductsEvent(this.id);
}

class OnClearFavoriteErrorMessage extends FavoriteEvent {}
