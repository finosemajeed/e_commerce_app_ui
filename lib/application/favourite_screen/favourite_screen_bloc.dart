import 'dart:developer';

import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/domain/fetch_products/fetch_product.dart';
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
        try {
          final favouriteItems = await FetchProduct().favouriteProduts();

          emit(FavouriteLoaded(
              favouriteItems: favouriteItems, isFavourite: true));
        } catch (e) {
          log(e.toString(), name: 'favourite load error');
          emit(FavouriteError());
        }
      } else if (event is FavouriteItemAdded) {
        try {
          final productId = event.item.id.toString();
          final isFavourite = event.isFavourite;
          await FavouriteScreenHelper()
              .switchProductFavouriteStatus(productId, isFavourite);
          emit(FavouriteAdded());
          final favouriteItems = await FetchProduct().favouriteProduts();
          emit(FavouriteLoaded(favouriteItems: favouriteItems));
        } catch (e) {
          log(e.toString(), name: 'favourite add error');
          emit(FavouriteError());
        }
      } else if (event is FavouriteItemRemoved) {
        try {
          final productId = event.item.id.toString();
          final isFavourite = event.isFavourite;
          await FavouriteScreenHelper()
              .switchProductFavouriteStatus(productId, isFavourite);
          emit(FavouriteRemoved());
          final favouriteItems = await FetchProduct().favouriteProduts();
          emit(FavouriteLoaded(favouriteItems: favouriteItems));
        } catch (e) {
          log(e.toString(), name: 'favourite remove error');
          emit(FavouriteError());
        }
      } else if (event is FavouriteCheck) {
        final productId = event.item.id.toString();
        final state =
            await FavouriteScreenHelper().isProductFavourite(productId);
        emit(FavouriteCheckState(state));
        final favouriteItems = await FetchProduct().favouriteProduts();
        emit(
            FavouriteLoaded(favouriteItems: favouriteItems, isFavourite: true));
      }
    });
  }
}
