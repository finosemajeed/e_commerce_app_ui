import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/db/data_model.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/product_view_screen/product_view_screen.dart';
import 'package:flutter/material.dart';

class ProductDetails {
  const ProductDetails({
    Key? key,
    required this.productId,
  });

  final productId;

  Widget addQuantityButton() {
    return SizedBox(
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
                    "$val",
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
    );
  }

  Widget productDescription() {
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
            productDetails[productId - 1].productDetails!,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }

  Widget productPrice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '\$ ${productDetails[productId - 1].productPrice.toString()}',
        style: const TextStyle(
          color: orange,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          wordSpacing: 2,
        ),
      ),
    );
  }

  Widget productName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        productDetails[productId - 1].productName!,
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

  Widget productCategory() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            productDetails[productId - 1].category!,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black26,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
