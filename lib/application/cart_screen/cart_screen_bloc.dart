import 'dart:developer';

import 'package:e_comerce_app_ui/db/cart_model.dart';
import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/domain/fetch_products/fetch_product.dart';
import 'package:e_comerce_app_ui/infrastructure/cart_screen/cart_screen_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartLoading()) {
    on<CartScreenEvent>(
      (event, emit) async {
        if (event is CartStarted) {
          try {
            final cartProducts = await FetchProduct().cartProduct();
            emit(CartLoaded(cart: Cart(items: cartProducts)));
          } catch (e) {
            log(e.toString(), name: 'Cart loaded error');
            emit(CartError());
          }
        } else if (event is CartItemAdded) {
          try {
            final productId = event.item.id.toString();
            await CartHelper().addProductToCart(productId);
            emit(const CartAddedSuccefull());
            final cartProducts = await FetchProduct().cartProduct();
            emit(CartLoaded(cart: Cart(items: cartProducts)));
          } catch (e) {
            log(e.toString(), name: 'Cart added error');
            emit(CartError());
          }
        } else if (event is CartItemRemoved) {
          try {
            final cartItemID = event.item.id.toString();
            await CartHelper().removeProductFromCart(cartItemID);
            emit(const CartRemoveSuccefull());
            final cartProducts = await FetchProduct().cartProduct();

            emit(CartLoaded(cart: Cart(items: cartProducts)));
          } catch (e) {
            log(e.toString(), name: 'Cart remove error');
            emit(CartError());
          }
        } else if (event is CartProductCountIncrement) {
          try {
            final productId = event.item.id.toString();
            await CartHelper().increaseCartItemCount(productId);
            final count = await CartHelper().getCartItemFromId(productId);
            emit(CartProductCount(count: count.itemCount));
          } catch (e) {
            log(e.toString(), name: 'Cart count error');
            emit(CartError());
          }
        } else if (event is CartProductCountIncrement) {
          try {
            final productId = event.item.id.toString();
            await CartHelper().increaseCartItemCount(productId);
            final count = await CartHelper().getCartItemFromId(productId);
            emit(CartProductCount(count: count.itemCount));
          } catch (e) {
            log(e.toString(), name: 'Cart count error');
            emit(CartError());
          }
        } else if (event is CartProductCountIntial) {
          try {
            emit(CartProductCount(count: event.count));
          } catch (e) {
            log(e.toString(), name: 'Cart count error');
            emit(CartError());
          }
        }
      },
    );
  }
}
