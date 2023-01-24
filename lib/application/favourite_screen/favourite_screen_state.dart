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
  const FavouriteLoaded({this.isFavourite = false});
  final bool isFavourite;

  @override
  List<Object> get props => [];
}

class FavouriteError extends FavouriteScreenState {
  @override
  List<Object> get props => [];
}

class FavouriteAdd extends FavouriteScreenState {
  @override
  List<Object> get props => [];
}
