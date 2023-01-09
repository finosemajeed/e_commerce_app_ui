
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key? key,
    required this.subTotal,
    required this.taxAndFee,
    this.deliveryCharge,
    required this.totalPrice,
  }) : super(key: key);
  final String subTotal;
  final String taxAndFee;
  final String? deliveryCharge;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              subTotal,
              style: const TextStyle(
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
              taxAndFee,
              style: const TextStyle(
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
              deliveryCharge ?? 'free',
              style: const TextStyle(
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
              totalPrice,
              style: const TextStyle(
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
              child: const Text(
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
    );
  }
}
