import 'dart:developer';

import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/domain/fetch_products/fetch_product.dart';
import 'package:e_comerce_app_ui/infrastructure/favourite_screen/favourite_screen_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_screen_event.dart';
part 'favourite_screen_state.dart';
part 'favourite_screen_bloc.freezed.dart';

class FavouriteScreenBloc
    extends Bloc<FavouriteScreenEvent, FavouriteScreenState> {
  FavouriteScreenBloc() : super(FavouriteScreenState.initial()) {
    on<FavouriteInitial>((event, emit) async {
      emit(const FavouriteScreenState(
        isLoading: true,
        isError: false,
        isFavourite: false,
        favouriteItems: [],
        favouriteAdded: false,
        favouriteRemoved: false,
      ));
      try {
        final favouriteItems = await FetchProduct().favouriteProduts();
        emit(FavouriteScreenState(
          isLoading: false,
          isError: false,
          isFavourite: false,
          favouriteItems: favouriteItems,
          favouriteAdded: false,
          favouriteRemoved: false,
        ));
      } catch (e) {
        log(e.toString(), name: 'favourite load error');
        const FavouriteScreenState(
          isLoading: false,
          isError: true,
          isFavourite: false,
          favouriteItems: [],
          favouriteAdded: false,
          favouriteRemoved: false,
        );
      }
    });
    on<FavouriteItemAdded>((event, emit) async {
      try {
        final productId = event.item.id.toString();
        await FavouriteScreenHelper()
            .switchProductFavouriteStatus(productId, true);
        final favouriteItems = await FetchProduct().favouriteProduts();
      
        emit(FavouriteScreenState(
          isLoading: false,
          isError: false,
          isFavourite: true,
          favouriteItems: favouriteItems,
          favouriteAdded: true,
          favouriteRemoved: false,
        ));
      } catch (e) {
        log(e.toString(), name: 'favourite add error');
        const FavouriteScreenState(
          isLoading: false,
          isError: true,
          isFavourite: false,
          favouriteItems: [],
          favouriteAdded: false,
          favouriteRemoved: false,
        );
      }
    });
    on<FavouriteItemRemoved>((event, emit) async {
      try {
        final productId = event.item.id.toString();
        await FavouriteScreenHelper()
            .switchProductFavouriteStatus(productId, false);
        final favouriteItems = await FetchProduct().favouriteProduts();
       
        emit(FavouriteScreenState(
          isLoading: false,
          isError: false,
          isFavourite: false,
          favouriteItems: favouriteItems,
          favouriteAdded: false,
          favouriteRemoved: true,
        ));
      } catch (e) {
        log(e.toString(), name: 'favourite remove error');
        const FavouriteScreenState(
          isLoading: false,
          isError: true,
          isFavourite: false,
          favouriteItems: [],
          favouriteAdded: false,
          favouriteRemoved: false,
        );
      }
    });
    on<FavouriteCheck>((event, emit) async {
      try {
        final productId = event.item.toString();
        final state =
            await FavouriteScreenHelper().isProductFavourite(productId);
        final favouriteItems = await FetchProduct().favouriteProduts();
        emit(FavouriteScreenState(
          isLoading: false,
          isError: false,
          isFavourite: state,
          favouriteItems: favouriteItems,
          favouriteAdded: false,
          favouriteRemoved: false,
        ));
      } catch (e) {
        log(e.toString(), name: 'favourite check error');
        const FavouriteScreenState(
          isLoading: false,
          isError: true,
          isFavourite: false,
          favouriteItems: [],
          favouriteAdded: false,
          favouriteRemoved: false,
        );
      }
    });
  }
}


    // on<FavouriteScreenEvent>((event, emit) async {
    //   emit(const FavouriteLoading());
    //   if (event is FavouriteStarted) {
    //     emit(const FavouriteLoading());
    //     try {
    //       final favouriteItems = await FetchProduct().favouriteProduts();

    //       emit(FavouriteLoaded(
    //           favouriteItems: favouriteItems, isFavourite: true));
    //     } catch (e) {
    //       log(e.toString(), name: 'favourite load error');
    //       emit(FavouriteError());
    //     }
    //   } else if (event is FavouriteItemAdded) {
    //     try {
    //       final productId = event.item.id.toString();
    //       final isFavourite = event.isFavourite;
    //       await FavouriteScreenHelper()
    //           .switchProductFavouriteStatus(productId, isFavourite);
    //       emit(FavouriteAdded());
    //       final favouriteItems = await FetchProduct().favouriteProduts();
    //       emit(FavouriteLoaded(favouriteItems: favouriteItems));
    //     } catch (e) {
    //       log(e.toString(), name: 'favourite add error');
    //       emit(FavouriteError());
    //     }
    //   } else if (event is FavouriteItemRemoved) {
    //     try {
    //       final productId = event.item.id.toString();
    //       final isFavourite = event.isFavourite;
    //       await FavouriteScreenHelper()
    //           .switchProductFavouriteStatus(productId, isFavourite);
    //       emit(FavouriteRemoved());
    //       final favouriteItems = await FetchProduct().favouriteProduts();
    //       emit(FavouriteLoaded(favouriteItems: favouriteItems));
    //     } catch (e) {
    //       log(e.toString(), name: 'favourite remove error');
    //       emit(FavouriteError());
    //     }
    //   } else if (event is FavouriteCheck) {
    //     final productId = event.item.id.toString();
    //     final state =
    //         await FavouriteScreenHelper().isProductFavourite(productId);
    //     emit(FavouriteCheckState(state));
    //     final favouriteItems = await FetchProduct().favouriteProduts();
    //     emit(
    //         FavouriteLoaded(favouriteItems: favouriteItems, isFavourite: true));
    //   }
    // });