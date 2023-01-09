import 'package:badges/badges.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/db/data_model.dart';
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
        iconTheme: IconThemeData(color: offBlack),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Badge(
              badgeContent: Text('3'),
              child: Icon(
                Icons.local_grocery_store_outlined,
                semanticLabel: '22',
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
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: ((context, index) {
                  return CustomCartItem(
                    productImage: productDetails[index].productImage.toString(),
                    productTitle: productDetails[index].productName.toString(),
                    produtPrice: productDetails[index].productPrice.toString(),
                  );
                })),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: orange.withOpacity(0.8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  dense: true,
                  title: Text(
                    'Subtotal',
                    style: TextStyle(
                      color: offWhite.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text(
                    '2323',
                    style: TextStyle(
                      color: offWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'Tax & Fees',
                    style: TextStyle(
                      color: offWhite.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text(
                    '33',
                    style: TextStyle(
                      color: offWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'Delivery',
                    style: TextStyle(
                      color: offWhite.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text(
                    'free',
                    style: TextStyle(
                      color: offWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'Total',
                    style: TextStyle(
                      color: offWhite.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text(
                    '2323',
                    style: TextStyle(
                      color: offWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      backgroundColor: offWhite,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
