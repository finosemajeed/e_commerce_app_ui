import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    Key? key,
    required this.productImage,
  }) : super(key: key);

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: textBlack),
      elevation: 0,
      pinned: true,
      centerTitle: false,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: Image(
          width: 300,
          height: 300,
          image: NetworkImage(productImage),
        ),
      ),
    );
  }
}
