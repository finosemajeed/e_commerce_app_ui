import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/product_view_screen/product_view_screen.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.productPrice,
  }) : super(key: key);

  final int? productPrice;

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
                  "${productPrice! * itemPriceNotifier.value}",
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
              onPressed: () => 'Null',
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(purple)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Buy Now',
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
