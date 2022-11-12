import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductCardList extends StatelessWidget {
  const ProductCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const [
          ProductCard(
            image: 'assets/products/tshirt.png',
            title: 'Tshirt',
            price: '299',
          ),
          ProductCard(
            image: 'assets/products/console.png',
            title: 'console',
            price: '899',
          ),
          ProductCard(
            image: 'assets/products/pants.png',
            title: 'Pants',
            price: '689',
          ),
          ProductCard(
            image: 'assets/products/women_bag.png',
            title: 'Women Bag',
            price: '1499',
          ),
          ProductCard(
            image: 'assets/products/women_dress.png',
            title: 'Women Dress',
            price: '800',
          ),
        ],
      ),
    );
  }
}
