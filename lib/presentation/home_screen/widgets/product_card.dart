import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
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
          _ItemCard(
            image: 'assets/products/tshirt.png',
            title: 'Tshirt',
            price: '299',
          ),
          _ItemCard(
            image: 'assets/products/console.png',
            title: 'console',
            price: '899',
          ),
          _ItemCard(
            image: 'assets/products/pants.png',
            title: 'Pants',
            price: '689',
          ),
          _ItemCard(
            image: 'assets/products/women_bag.png',
            title: 'Women Bag',
            price: '1499',
          ),
          _ItemCard(
            image: 'assets/products/women_dress.png',
            title: 'Women Dress',
            price: '800',
          ),
        ],
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);
  final String image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: offWhite, borderRadius: BorderRadius.circular(20)),
              width: 150,
              height: 160,
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: Text(
                '??? $price',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
