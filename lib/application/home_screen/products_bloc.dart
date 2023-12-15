import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/db/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsListBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsListBloc() : super(ProductsLoading()) {
    on<ProductsEvent>((event, emit) async {
      if (event is FetchProducts) {
        emit(ProductsLoading());
        final data = ProductRepository.fetchProducts();
        emit(ProductsLoaded(data));
      } else {
        emit(ProductListError());
      }
    });
  }
}
