part of 'cart_screen_bloc.dart';

@freezed
class CartScreenEvent with _$CartScreenEvent {
  const factory CartScreenEvent.started() = Started;
  const factory CartScreenEvent.cartItemAdded(
      {required Products product, required int productCount}) = CartItemAdded;
  const factory CartScreenEvent.cartItemRemoved({required Products product}) =
      CartItemRemoved;
  const factory CartScreenEvent.cartItemCountIncrement(
      {required Products product}) = CartItemCountIncrement;
  const factory CartScreenEvent.cartItemCountDecremetn(
      {required Products product}) = CartItemCountDecrement;
  const factory CartScreenEvent.cartItemCountInitial({required int count}) =
      CartItemCountInitial;
  const factory CartScreenEvent.cartItemCount({required Products product}) =
      CartItemCount;
}

// class CartStarted extends CartScreenEvent {
//   @override
//   List<Object?> get props => [];
// }

// class CartItemAdded extends CartScreenEvent {
//   const CartItemAdded(this.item);
//   final Products item;
//   @override
//   List<Object?> get props => [item];
// }

// class CartItemRemoved extends CartScreenEvent {
//   const CartItemRemoved(this.item);
//   final Products item;
//   @override
//   List<Object?> get props => [item];
// }

// class CartProductCountIncrement extends CartScreenEvent {
//   const CartProductCountIncrement(this.item);
//   final Products item;
//   @override
//   List<Object?> get props => [];
// }

// class CartProductCountDecrement extends CartScreenEvent {
//   const CartProductCountDecrement(this.item);
//   final Products item;
//   @override
//   List<Object?> get props => [];
// }

// class CartProductCountIntial extends CartScreenEvent {
//   const CartProductCountIntial({this.count = 1});
//   final int count;
//   @override
//   List<Object?> get props => [];
// }
