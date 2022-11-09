import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration:
          BoxDecoration(color: purple, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              'A Summer Surprice',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: offWhite,
              ),
            ),
            Text(
              'Cashback 20%',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
