import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/db/data_model.dart';
import 'package:flutter/material.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final productId;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: textBlack),
      elevation: 0,
      pinned: true,
      centerTitle: false,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: Image(
          width: 300,
          height: 300,
          image: AssetImage(productDetails[productId - 1].productImage!),
        ),
      ),
    );
  }
}
