import 'package:e_comerce_app_ui/db/data_model.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/product_view_screen/product_view_screen.dart';
import 'package:e_comerce_app_ui/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductCardList extends StatelessWidget {
  const ProductCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productDetails.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) =>
                    ScreenCardView(productId: productDetails[index].id))));
          },
          child: ProductCard(
            image: productDetails[index].productImage!,
            title: productDetails[index].productName!,
            price: productDetails[index].productPrice.toString(),
          ),
        ),
      ),
    );
  }
}
