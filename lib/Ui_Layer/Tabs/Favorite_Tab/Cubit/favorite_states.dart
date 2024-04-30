abstract class FavoriteStates {}

class FavoriteInitialState extends FavoriteStates {}

class FavoriteLoadingState extends FavoriteStates {
  String? message;

  FavoriteLoadingState({required this.message});
}

class FavoriteErrorState extends FavoriteStates {
  String? message;

  FavoriteErrorState({required this.message});
}

class GetFavoriteSuccessState extends FavoriteStates {
  GetFavoriteSuccessState();
}
