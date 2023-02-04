import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/domain/fetch_products/fetch_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:developer';

part 'search_screen_event.dart';
part 'search_screen_state.dart';
part 'search_screen_bloc.freezed.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc() : super(SearchScreenState.initial()) {
    on<Initilize>((event, emit) {
      emit(const SearchScreenState(
        searchQuery: '',
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
    });

    on<SearchProduct>((event, emit) {
      final searchQuery = event.productQuerry;
      log(searchQuery, name: 'querry');
      final products = FetchProduct().allProducts();
      final items = products
          .where((element) => element.id.toString() == searchQuery)
          .toList();
      // log(items[0].toString(), name: 'serched item');
      emit(SearchScreenState(
        searchQuery: searchQuery,
        searchResultList: items,
        idleList: [],
        isLoading: false,
        isError: false,
      ));
      // emit(SearchScreenState(
      //   searchQuery: searchQuery,
      //   searchResultList: items,
      //   idleList: [],
      //   isLoading: false,
      //   isError: false,
      // ));
    });
  }
}
