import 'dart:developer';

import 'package:e_comerce_app_ui/application/cart_screen/cart_screen_bloc.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/cart_screen/widgets/widgets_cart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: offBlack),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Badge(
              label: Text('0'),
              child: Icon(
                Icons.local_grocery_store_outlined,
              ),
            ),
          )
        ],
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          BlocConsumer<CartScreenBloc, CartScreenState>(
            listener: (context, state) {
              if (state.cartRemoved) {
                Fluttertoast.showToast(msg: 'Product removed from cart');
              }
            },
            builder: (context, state) {
              final cartItem = state.cartItems.items;
              log(cartItem.toString());
              if (state.isLoading) {
                return Wrap(
                  children: const [
                    Center(child: CircularProgressIndicator()),
                    Center(child: Text('Cart Items Loading')),
                  ],
                );
              }
              if (cartItem.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartItem.length,
                    itemBuilder: ((context, index) {
                      return CustomCartItem(
                        product: cartItem[index],
                        productImage: cartItem[index].image.toString(),
                        productTitle: cartItem[index].title.toString(),
                        produtPrice: cartItem[index].price.toString(),
                      );
                    }),
                  ),
                );
              } else if (cartItem.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(
                      'assets/lottie_animation/empty_box.json',
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.width / 1.5,
                    ),
                    const Center(
                      child: Text(
                        'Cart is empty',
                        style: TextStyle(
                          color: offOrange,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Spacer();
            },
          ),
        ],
      ),
      bottomNavigationBar: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<CartScreenBloc, CartScreenState>(
                builder: (context, state) {
              return Text(
                state.cartTotal.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
          ElevatedButton(
              onPressed: (() => {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: ((context) => const CheckOutCard(
                            subTotal: '35',
                            taxAndFee: '245',
                            totalPrice: '5',
                          )),
                    ),
                  }),
              child: const Text('Checkout'))
        ],
      ),
    );
  }
}
