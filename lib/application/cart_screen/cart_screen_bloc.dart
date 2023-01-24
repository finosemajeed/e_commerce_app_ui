import 'package:e_comerce_app_ui/db/cart_model.dart';
import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/db/product_repository.dart';
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
          emit(CartLoading());
          try {
            var productList = await ProductRepository.fetchProducts();
            var cartIds = await CartHelper().allCartItemsList;
            final cartProducts = productList
                .where((element) => cartIds!.contains(element.id))
                .toList();
            emit(CartLoaded(cart: Cart(items: cartProducts)));
            emit(const CartProductCount());
          } catch (_) {
            emit(CartError());
          }
        } else if (event is CartItemAdded) {
          final productId = event.item.id.toString();
          await CartHelper().addProductToCart(productId);
          var productList = await ProductRepository.fetchProducts();
          var cartIds = await CartHelper().allCartItemsList;
          final cartProducts = productList
              .where((element) => cartIds!.contains(element.id))
              .toList();
          emit(CartLoaded(cart: Cart(items: cartProducts)));
          emit(CartAddedSuccefull(cart: Cart(items: cartProducts)));
        } else if (event is CartItemRemoved) {
          final cartItemID = event.item.id.toString();
          await CartHelper().removeProductFromCart(cartItemID);
          var productList = await ProductRepository.fetchProducts();
          var cartIds = await CartHelper().allCartItemsList;
          final cartProducts = productList
              .where((element) => cartIds!.contains(element.id))
              .toList();
          emit(CartRemoveSuccefull(cart: Cart(items: cartProducts)));
          emit(CartLoaded(cart: Cart(items: cartProducts)));
        } else if (event is CartProductCountEvent) {
          final count = event.count;
          emit(CartProductCount(count: count));
        }
      },
    );
  }

}
  