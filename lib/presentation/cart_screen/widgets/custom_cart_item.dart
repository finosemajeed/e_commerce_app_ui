import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/product_view_screen/product_view_screen.dart';
import 'package:flutter/material.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    Key? key,
    required this.productImage,
    required this.productTitle,
    required this.produtPrice,
  }) : super(key: key);

  final String productImage;
  final String productTitle;
  final String produtPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 2,
        shadowColor: orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset(productImage),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    productTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 25,
                      color: textBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: ValueListenableBuilder(
                        valueListenable: itemPriceNotifier,
                        builder: (context, val, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  itemPriceNotifier.value > 1
                                      ? itemPriceNotifier.value--
                                      : itemPriceNotifier.value;
                                },
                                icon: const Icon(
                                  Icons.horizontal_rule,
                                  size: 35,
                                  color: orange,
                                ),
                              ),
                              Text(
                                "${val}",
                                style: const TextStyle(fontSize: 35),
                              ),
                              IconButton(
                                onPressed: () {
                                  itemPriceNotifier.value++;
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 35,
                                  color: orange,
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    produtPrice,
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
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: offBlack,
                ))
          ],
        ),
      ),
    );
  }
}
