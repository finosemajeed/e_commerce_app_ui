import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class SpecialItemCard extends StatelessWidget {
  const SpecialItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const [
          _ItemCard(
            image: 'assets/images/gaming.jfif',
            titel: 'Game',
            subtitle: '5 Brands',
          ),
          _ItemCard(
            image: 'assets/images/smartphone.jfif',
            titel: 'Smartphone',
            subtitle: '8 Brands',
          ),
          _ItemCard(
            image: 'assets/images/fashion.jfif',
            titel: 'Fashion',
            subtitle: '23 Brands',
          ),
          _ItemCard(
            image: 'assets/images/grocery.jfif',
            titel: 'grocery',
            subtitle: '7 Brands',
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
    required this.titel,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String titel;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            color: purple, borderRadius: BorderRadius.circular(20)),
        width: 200,
        height: 100,
        child: Stack(
          children: [
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(70, 0, 0, 0), BlendMode.multiply),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 20,
              child: Text(
                titel,
                style: const TextStyle(
                  color: Color.fromARGB(216, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Color.fromARGB(216, 255, 255, 255),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
