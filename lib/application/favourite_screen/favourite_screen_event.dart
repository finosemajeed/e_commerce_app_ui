part of 'favourite_screen_bloc.dart';

@freezed
class FavouriteScreenEvent with _$FavouriteScreenEvent {
  const factory FavouriteScreenEvent.favouriteInitial() = FavouriteInitial;
  const factory FavouriteScreenEvent.favouriteItemAdded(
      {required Products item}) = FavouriteItemAdded;
  const factory FavouriteScreenEvent.favouriteItemRemoved(
      {required Products item}) = FavouriteItemRemoved;
  const factory FavouriteScreenEvent.favouriteCheck({required int item}) =
      FavouriteCheck;
}

// class FavouriteStarted extends FavouriteScreenEvent {
//   @override
//   List<Object?> get props => [];
// }

// class FavouriteItemAdded extends FavouriteScreenEvent {
//   const FavouriteItemAdded({required this.item, this.isFavourite = true});

//   final Products item;
//   final bool isFavourite;

//   @override
//   List<Object?> get props => [item];
// }

// class FavouriteItemRemoved extends FavouriteScreenEvent {
//   const FavouriteItemRemoved({required this.item, this.isFavourite = false});

//   final Products item;
//   final bool isFavourite;

//   @override
//   List<Object?> get props => [item];
// }

// class FavouriteCheck extends FavouriteScreenEvent {
//   const FavouriteCheck(this.item);
//   final Products item;

//   @override
//   List<Object?> get props => [];
// }
