part of 'cart_screen_bloc.dart';

@freezed
class CartScreenState with _$CartScreenState {
  const factory CartScreenState({
    required bool isLoading,
    required Cart cartItems,
    required bool isError,
    required bool cartAdded,
    required bool cartRemoved,
    required int itemCount,
    required num cartTotal,
  }) = _CartScreenState;

  factory CartScreenState.initial() => const CartScreenState(
        isLoading: false,
        cartItems: Cart(),
        isError: false,
        cartAdded: false,
        cartRemoved: false,
        itemCount: 1,
        cartTotal: 0,
      );
}
// class CartScreenState extends Equatable {
//   const CartScreenState();

//   @override
//   List<Object?> get props => [];
// }

// class CartLoading extends CartScreenState {
//   @override
//   List<Object?> get props => [];
// }

// class CartLoaded extends CartScreenState {
//   const CartLoaded({this.cart = const Cart()});
//   final Cart cart;

//   @override
//   List<Object?> get props => [cart];
// }

// class CartError extends CartScreenState {
//   @override
//   List<Object?> get props => [];
// }

// class CartAddedSuccefull extends CartScreenState {
//   const CartAddedSuccefull();

//   @override
//   List<Object?> get props => [];
// }

// class CartRemoveSuccefull extends CartScreenState {
//   const CartRemoveSuccefull();

//   @override
//   List<Object?> get props => [];
// }

// class CartProductCount extends CartScreenState {
//   const CartProductCount({this.count = 1});
//   final int count;
//   @override
//   List<Object?> get props => [count];
// }
