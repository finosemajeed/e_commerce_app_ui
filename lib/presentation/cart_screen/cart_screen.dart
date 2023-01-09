import 'package:badges/badges.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/db/data_model.dart';
import 'package:e_comerce_app_ui/presentation/cart_screen/widgets/check_out_card.dart';
import 'package:e_comerce_app_ui/presentation/cart_screen/widgets/custom_cart_item.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: offBlack),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Badge(
              badgeContent: Text(productDetails.length.toString()),
              child: const Icon(
                Icons.local_grocery_store_outlined,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'My Cart',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: ((context, index) {
                  return CustomCartItem(
                    productImage: productDetails[index].productImage.toString(),
                    productTitle: productDetails[index].productName.toString(),
                    produtPrice: productDetails[index].productPrice.toString(),
                  );
                })),
          ),
          const CheckOutCard(
            subTotal: '2322',
            taxAndFee: '40',
            totalPrice: '4000',
          )
        ],
      ),
    );
  }
}
