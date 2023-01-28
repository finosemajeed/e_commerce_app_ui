part of 'cart_screen_bloc.dart';

abstract class CartScreenEvent extends Equatable {
  const CartScreenEvent();
}

class CartStarted extends CartScreenEvent {
  @override
  List<Object?> get props => [];
}

class CartItemAdded extends CartScreenEvent {
  const CartItemAdded(this.item);
  final Products item;
  @override
  List<Object?> get props => [item];
}

class CartItemRemoved extends CartScreenEvent {
  const CartItemRemoved(this.item);
  final Products item;
  @override
  List<Object?> get props => [item];
}

class CartProductCountIncrement extends CartScreenEvent {
  const CartProductCountIncrement(this.item);
  final Products item;
  @override
  List<Object?> get props => [];
}

class CartProductCountDecrement extends CartScreenEvent {
  const CartProductCountDecrement(this.item);
  final Products item;
  @override
  List<Object?> get props => [];
}

class CartProductCountIntial extends CartScreenEvent {
  const CartProductCountIntial({this.count = 1});
  final int count;
  @override
  List<Object?> get props => [];
}
