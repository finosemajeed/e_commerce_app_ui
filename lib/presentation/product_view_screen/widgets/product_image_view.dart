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
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            FadeInImage.assetNetwork(
              height: 250,
              width: 200,
              placeholder: 'assets/lottie_animation/image_loading.gif',
              image: productImage,
            )
          ],
        ),
      ),
    );
  }
}
