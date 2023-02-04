part of 'favourite_screen_bloc.dart';

@freezed
class FavouriteScreenState with _$FavouriteScreenState {
  const factory FavouriteScreenState({
    required bool isLoading,
    required bool isError,
    required bool isFavourite,
    required List<Products>? favouriteItems,
    required bool favouriteAdded,
    required bool favouriteRemoved,
  }) = _FavouriteScreenState;

  factory FavouriteScreenState.initial() => const FavouriteScreenState(
        isLoading: false,
        isError: false,
        isFavourite: false,
        favouriteItems: [],
        favouriteAdded: false,
        favouriteRemoved: false,
      );
}

// class FavouriteLoading extends FavouriteScreenState {
//   const FavouriteLoading();
// }

// class FavouriteLoaded extends FavouriteScreenState {
//   const FavouriteLoaded({this.favouriteItems, this.isFavourite = false});
//   final bool isFavourite;
//   final List<Products>? favouriteItems;

//   @override
//   List<Object> get props => [];
// }

// class FavouriteError extends FavouriteScreenState {
//   @override
//   List<Object> get props => [];
// }

// class FavouriteAdded extends FavouriteScreenState {
//   @override
//   List<Object> get props => [];
// }

// class FavouriteRemoved extends FavouriteScreenState {
//   @override
//   List<Object> get props => [];
// }

// class FavouriteCheckState extends FavouriteScreenState {
//   const FavouriteCheckState(this.isFavourite);
//   final bool isFavourite;
//   @override
//   List<Object> get props => [];
// }
