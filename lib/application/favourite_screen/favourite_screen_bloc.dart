import 'dart:developer';

import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/db/product_repository.dart';
import 'package:e_comerce_app_ui/infrastructure/favourite_screen/favourite_screen_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_screen_event.dart';
part 'favourite_screen_state.dart';

class FavouriteScreenBloc
    extends Bloc<FavouriteScreenEvent, FavouriteScreenState> {
  FavouriteScreenBloc() : super(const FavouriteLoading()) {
    on<FavouriteScreenEvent>((event, emit) async {
      emit(const FavouriteLoading());
      if (event is FavouriteStarted) {
        emit(const FavouriteLoading());
        emit(const FavouriteLoaded());
        try {
          var productList = await ProductRepository.fetchProducts();
          var favouriteItems =
              await FavouriteScreenHelper().usersFavouriteProductsList;
          log(favouriteItems.toString(), name: 'favourite list');
        } catch (e) {
          log(e.toString(), name: 'favourite load error');
          emit(FavouriteError());
        }
      } else if (event is FavouriteItemAdded) {
        try {
          final productId = event.item.id.toString();
          final isFavourite = event.isFavourite;
          final status =
              await FavouriteScreenHelper().isProductFavourite(productId);
          if (status == false) {
            await FavouriteScreenHelper()
                .switchProductFavouriteStatus(productId, isFavourite);
          }
        } catch (e) {
          log(e.toString(), name: 'favourite add error');
          emit(FavouriteError());
        }
      }
    });
  }
}
