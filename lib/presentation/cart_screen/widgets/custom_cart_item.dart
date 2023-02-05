import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/presentation/product_view_screen/product_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/cart_screen/cart_screen_bloc.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    Key? key,
    required this.productImage,
    required this.productTitle,
    required this.produtPrice,
    required this.product,
  }) : super(key: key);

  final String productImage;
  final String productTitle;
  final String produtPrice;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) =>
                        ProductViewScreen(productId: product.id!.toInt())));
              },
              child: Container(
                color: Colors.white,
                height: 150,
                width: 150,
                child: Image.network(productImage),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 25,
                        color: textBlack,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                BlocBuilder<CartScreenBloc, CartScreenState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 40,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.horizontal_rule,
                                size: 35,
                                color: orange,
                              ),
                            ),
                            Text(
                              state.itemCount.toString(),
                              style: const TextStyle(fontSize: 35),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                size: 35,
                                color: orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$ $produtPrice',
                    style: const TextStyle(
                      color: orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
            BlocBuilder<CartScreenBloc, CartScreenState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context
                          .read<CartScreenBloc>()
                          .add(CartItemRemoved(product: product));
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                      color: offBlack,
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
