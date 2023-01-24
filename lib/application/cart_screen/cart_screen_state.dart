part of 'cart_screen_bloc.dart';

class CartScreenState extends Equatable {
  const CartScreenState();

  @override
  List<Object?> get props => [];
}

class CartLoading extends CartScreenState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartScreenState {
  const CartLoaded({this.cart = const Cart()});
  final Cart cart;

  @override
  List<Object?> get props => [cart];
}

class CartError extends CartScreenState {
  @override
  List<Object?> get props => [];
}

class CartAddedSuccefull extends CartScreenState {
  const CartAddedSuccefull({this.cart = const Cart()});
  final Cart cart;

  @override
  List<Object?> get props => [cart];
}

class CartRemoveSuccefull extends CartScreenState {
  const CartRemoveSuccefull({this.cart = const Cart()});
  final Cart cart;

  @override
  List<Object?> get props => [cart];
}

class CartProductCount extends CartScreenState {
  const CartProductCount({this.count = 0});
  final int count;
  @override
  List<Object?> get props => [count];
}
