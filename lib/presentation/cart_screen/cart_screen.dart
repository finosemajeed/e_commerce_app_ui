import 'package:badges/badges.dart';
import 'package:e_comerce_app_ui/application/cart_screen/cart_screen_bloc.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/cart_screen/widgets/check_out_card.dart';
import 'package:e_comerce_app_ui/presentation/cart_screen/widgets/custom_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenBloc, CartScreenState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: offBlack),
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Icon(
                    Icons.local_grocery_store_outlined,
                  ),
                )
              ],
            ),
            body: Center(
                child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Text('Cart Items loading')
              ],
            )),
          );
        } else if (state is CartLoaded) {
          final cartItem = state.cart.items;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: const IconThemeData(color: offBlack),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Badge(
                      badgeContent: Text('${cartItem.length}'),
                      child: const Icon(
                        Icons.local_grocery_store_outlined,
                      ),
                    ),
                  )
                ],
              ),
              body: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartItem.length,
                  itemBuilder: ((context, index) {
                    return CustomCartItem(
                      product: cartItem[index],
                      productImage: cartItem[index].image.toString(),
                      productTitle: cartItem[index].title.toString(),
                      produtPrice: cartItem[index].price.toString(),
                    );
                  })),
              bottomNavigationBar: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('2500'),
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
                                    )))
                          }),
                      child: const Text('Checkout'))
                ],
              ));
        }
        return const Spacer();
      },
    );
  }
}
