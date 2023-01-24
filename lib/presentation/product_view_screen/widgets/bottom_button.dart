import 'package:e_comerce_app_ui/application/cart_screen/cart_screen_bloc.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:e_comerce_app_ui/presentation/product_view_screen/product_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.productPrice,
    required this.product,
  }) : super(key: key);

  final int productPrice;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
              valueListenable: itemPriceNotifier,
              builder: (context, val, _) {
                return Text(
                  "${productPrice * itemPriceNotifier.value}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () =>
                  context.read<CartScreenBloc>().add(CartItemAdded(product)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(purple)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
