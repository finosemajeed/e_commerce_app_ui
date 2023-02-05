import 'dart:developer';

import 'package:e_comerce_app_ui/db/cart_model.dart';
import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/domain/fetch_products/fetch_product.dart';
import 'package:e_comerce_app_ui/infrastructure/cart_screen/cart_screen_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';
part 'cart_screen_bloc.freezed.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenState.initial()) {
    on<Started>((event, emit) async {
      emit(const CartScreenState(
        isLoading: true,
        cartItems: Cart(),
        isError: false,
        cartAdded: false,
        cartRemoved: false,
        itemCount: 1,
        cartTotal: 0,
      ));
      try {
        final cartProducts = await FetchProduct().cartProduct();
        final cartTotal = await CartHelper().cartTotal;
        emit(CartScreenState(
          isLoading: false,
          cartItems: Cart(items: cartProducts),
          isError: false,
          cartAdded: false,
          cartRemoved: false,
          itemCount: 1,
          cartTotal: cartTotal,
        ));
      } catch (e) {
        emit(const CartScreenState(
          isLoading: false,
          cartItems: Cart(),
          isError: true,
          cartAdded: false,
          cartRemoved: false,
          itemCount: 1,
          cartTotal: 0,
        ));
        log(e.toString(), name: 'Cart loaded error');
      }
    });

    on<CartItemAdded>((event, emit) async {
      try {
        final productId = event.product.id.toString();
        final productCount = event.productCount;
        await CartHelper().addProductToCart(productId, productCount);
        final cartProducts = await FetchProduct().cartProduct();
        final cartTotal = await CartHelper().cartTotal;
        emit(CartScreenState(
          isLoading: false,
          cartItems: Cart(items: cartProducts),
          isError: false,
          cartAdded: true,
          cartRemoved: false,
          itemCount: 1,
          cartTotal: cartTotal,
        ));
      } catch (e) {
        emit(const CartScreenState(
          isLoading: false,
          cartItems: Cart(),
          isError: true,
          cartAdded: false,
          cartRemoved: false,
          itemCount: 1,
          cartTotal: 0,
        ));
        log(e.toString(), name: 'Cart Added error');
      }
    });
    on<CartItemRemoved>((event, emit) async {
      try {
        final cartItemID = event.product.id.toString();
        await CartHelper().removeProductFromCart(cartItemID);
        final cartProducts = await FetchProduct().cartProduct();
        final cartTotal = await CartHelper().cartTotal;
        emit(CartScreenState(
          isLoading: false,
          cartItems: Cart(items: cartProducts),
          isError: false,
          cartAdded: true,
          cartRemoved: false,
          itemCount: 1,
          cartTotal: cartTotal,
        ));
      } catch (e) {
        emit(const CartScreenState(
          isLoading: false,
          cartItems: Cart(),
          isError: true,
          cartAdded: false,
          cartRemoved: false,
          itemCount: 1,
          cartTotal: 0,
        ));
        log(e.toString(), name: 'Cart Removed error');
      }
    });
    on<CartItemCountInitial>((event, emit) async {
      try {
        final cartProducts = await FetchProduct().cartProduct();
        emit(CartScreenState(
          isLoading: false,
          cartItems: Cart(items: cartProducts),
          isError: false,
          cartAdded: false,
          cartRemoved: false,
          itemCount: event.count,
          cartTotal: 0,
        ));
      } catch (e) {
        emit(const CartScreenState(
            isLoading: false,
            cartItems: Cart(),
            isError: true,
            cartAdded: false,
            cartRemoved: false,
            itemCount: 1,
            cartTotal: 0));
        log(e.toString(), name: 'Cart Count Initial error');
      }
    });
    on<CartItemCount>((event, emit) async {
      try {
        final productId = event.product.id.toString();
        final cartProducts = await FetchProduct().cartProduct();
        final itemCount = await CartHelper().getCartItemFromId(productId);
        final cartTotal = await CartHelper().cartTotal;
        emit(CartScreenState(
          isLoading: false,
          cartItems: Cart(items: cartProducts),
          isError: false,
          cartAdded: false,
          cartRemoved: false,
          itemCount: itemCount.itemCount,
          cartTotal: cartTotal,
        ));
      } catch (e) {
        emit(const CartScreenState(
          isLoading: false,
          cartItems: Cart(),
          isError: true,
          cartAdded: false,
          cartRemoved: false,
          itemCount: 1,
          cartTotal: 0,
        ));
        log(e.toString(), name: 'Cart count error');
      }
    });
  }
}
