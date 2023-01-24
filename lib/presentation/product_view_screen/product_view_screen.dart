import 'package:e_comerce_app_ui/application/home_screen/products_bloc.dart';
import 'package:e_comerce_app_ui/presentation/product_view_screen/widgets/bottom_button.dart';
import 'package:e_comerce_app_ui/presentation/product_view_screen/widgets/product_details.dart';
import 'package:e_comerce_app_ui/presentation/product_view_screen/widgets/product_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ValueNotifier<int> itemPriceNotifier = ValueNotifier(1);

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    int productPrice;
    return SafeArea(
      child: BlocBuilder<ProductsListBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            final product = state.productList[productId - 1];
            return Scaffold(
              backgroundColor: Colors.white,
              body: CustomScrollView(
                primary: true,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  ProductImageView(productImage: product.image.toString()),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const ProductDetails().productCategory(
                            product.category ?? 'category', product),
                        const ProductDetails()
                            .productName(product.title ?? 'product name'),
                        const ProductDetails()
                            .productPrice(product.price.toString()),
                        const ProductDetails().addQuantityButton(),
                        const ProductDetails().productDescription(
                            product.description ?? 'Description'),
                      ],
                    ),
                  )
                ],
              ),
              bottomNavigationBar: BottomButton(
                productPrice: product.price?.toInt() ?? 0,
                product: product,
              ),
            );
          }
          return const Spacer();
        },
      ),
    );
  }
}
