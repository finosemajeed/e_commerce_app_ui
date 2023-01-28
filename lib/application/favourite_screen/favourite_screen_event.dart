part of 'favourite_screen_bloc.dart';

abstract class FavouriteScreenEvent extends Equatable {
  const FavouriteScreenEvent();
}

class FavouriteStarted extends FavouriteScreenEvent {
  @override
  List<Object?> get props => [];
}

class FavouriteItemAdded extends FavouriteScreenEvent {
  const FavouriteItemAdded({required this.item, this.isFavourite = true});

  final Products item;
  final bool isFavourite;

  @override
  List<Object?> get props => [item];
}

class FavouriteItemRemoved extends FavouriteScreenEvent {
  const FavouriteItemRemoved({required this.item, this.isFavourite = false});

  final Products item;
  final bool isFavourite;

  @override
  List<Object?> get props => [item];
}

class FavouriteCheck extends FavouriteScreenEvent {
  const FavouriteCheck(this.item);
  final Products item;

  @override
  List<Object?> get props => [];
}
