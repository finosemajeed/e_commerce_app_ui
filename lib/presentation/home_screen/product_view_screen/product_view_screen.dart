import 'package:e_comerce_app_ui/db/data_model.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/product_view_screen/widgets/bottom_button.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/product_view_screen/widgets/product_details.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/product_view_screen/widgets/product_image_view.dart';
import 'package:flutter/material.dart';

ValueNotifier itemPriceNotifier = ValueNotifier(1);

class ScreenCardView extends StatelessWidget {
  const ScreenCardView({
    super.key,
    required this.productId,
  });

  final productId;

  @override
  Widget build(BuildContext context) {
    int? productPrice = productDetails[productId - 1].productPrice?.toInt();

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        primary: true,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        slivers: [
          ProductImageView(productId: productId),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ProductDetails(productId: productId).productCategory(),
                ProductDetails(productId: productId).productName(),
                ProductDetails(productId: productId).productPrice(),
                ProductDetails(productId: productId).addQuantityButton(),
                ProductDetails(productId: productId).productDescription(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomButton(productPrice: productPrice),
    );
  }
}
