part of 'search_screen_bloc.dart';

@freezed
class SearchScreenState with _$SearchScreenState {
  const factory SearchScreenState({
    required String searchQuery,
    required List<Products> searchResultList,
    required List idleList,
    required bool isLoading,
    required bool isError,
  }) = _SearchScreenState;

  factory SearchScreenState.initial() => const SearchScreenState(
        searchQuery: '',
        searchResultList: [],
        idleList: [],
        isLoading: false,
        isError: false,
      );
}
