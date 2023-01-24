import 'package:cart_stepper/cart_stepper.dart';
import 'package:e_comerce_app_ui/application/cart_screen/cart_screen_bloc.dart';
import 'package:e_comerce_app_ui/application/favourite_screen/favourite_screen_bloc.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails {
  const ProductDetails({
    Key? key,
  });

  Widget addQuantityButton() {
    return Center(child: BlocBuilder<CartScreenBloc, CartScreenState>(
      builder: (context, state) {
        if (state is CartProductCount) {
          return CartStepper(
            didChangeCount: (value) {
              context.read<CartScreenBloc>().add(CartProductCountEvent(value));
            },
            value: state.count,
            size: 60,
            numberSize: 4,
            style: const CartStepperStyle(
              activeForegroundColor: orange,
              activeBackgroundColor: Colors.transparent,
              foregroundColor: orange,
              elevation: 0,
            ),
          );
        }
        return const Spacer();
      },
    ));
    // return SizedBox(
    //   height: 80,
    //   child: Center(
    //     child: ValueListenableBuilder(
    //         valueListenable: itemPriceNotifier,
    //         builder: (context, val, _) {
    //           return Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               IconButton(
    //                 onPressed: () {
    //                   itemPriceNotifier.value > 1
    //                       ? itemPriceNotifier.value--
    //                       : itemPriceNotifier.value;
    //                 },
    //                 icon: const Icon(
    //                   Icons.horizontal_rule,
    //                   size: 35,
    //                   color: orange,
    //                 ),
    //               ),
    //               Text(
    //                 "$val",
    //                 style: const TextStyle(fontSize: 35),
    //               ),
    //               IconButton(
    //                 onPressed: () {
    //                   itemPriceNotifier.value++;
    //                 },
    //                 icon: const Icon(
    //                   Icons.add,
    //                   size: 35,
    //                   color: orange,
    //                 ),
    //               ),
    //             ],
    //           );
    //         }),
    //   ),
    // );
  }

  Widget productDescription(String productDescription) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            productDescription,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }

  Widget productPrice(String productPrice) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '\$ $productPrice',
        style: const TextStyle(
          color: orange,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          wordSpacing: 2,
        ),
      ),
    );
  }

  Widget productName(String productName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        productName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 30,
          color: textBlack,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget productCategory(String category, Products product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black26,
              fontWeight: FontWeight.w500,
            ),
          ),
          BlocBuilder<FavouriteScreenBloc, FavouriteScreenState>(
            builder: (context, state) {
              if (state is FavouriteLoaded) {
                final isFavourite = state.isFavourite;
                return IconButton(
                  onPressed: () {
                    context.read<FavouriteScreenBloc>().add(
                        FavouriteItemAdded(item: product, isFavourite: true));
                  },
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                );
              }
              return const Spacer();
            },
          ),
        ],
      ),
    );
  }
}
