part of 'favourite_screen_bloc.dart';

abstract class FavouriteScreenState extends Equatable {
  const FavouriteScreenState();

  @override
  List<Object> get props => [];
}

class FavouriteLoading extends FavouriteScreenState {
  const FavouriteLoading();
}

class FavouriteLoaded extends FavouriteScreenState {
  const FavouriteLoaded({this.favouriteItems, this.isFavourite = false});
  final bool isFavourite;
  final List<Products>? favouriteItems;

  @override
  List<Object> get props => [];
}

class FavouriteError extends FavouriteScreenState {
  @override
  List<Object> get props => [];
}

class FavouriteAdded extends FavouriteScreenState {
  @override
  List<Object> get props => [];
}

class FavouriteRemoved extends FavouriteScreenState {
  @override
  List<Object> get props => [];
}

class FavouriteCheckState extends FavouriteScreenState {
  const FavouriteCheckState(this.isFavourite);
  final bool isFavourite;
  @override
  List<Object> get props => [];
}
