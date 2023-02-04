part of 'search_screen_bloc.dart';

@freezed
class SearchScreenEvent with _$SearchScreenEvent {
  const factory SearchScreenEvent.intitialize() = Initilize;
  const factory SearchScreenEvent.searchProduct({
    required String productQuerry,
  }) = SearchProduct;
}
