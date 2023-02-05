import 'package:e_comerce_app_ui/application/cart_screen/cart_screen_bloc.dart';
import 'package:e_comerce_app_ui/application/favourite_screen/favourite_screen_bloc.dart';
import 'package:e_comerce_app_ui/application/home_screen/products_bloc.dart';
import 'package:e_comerce_app_ui/presentation/product_view_screen/widgets/widgets_product_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<CartScreenBloc>().add(const Started());
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context
            .read<FavouriteScreenBloc>()
            .add(FavouriteCheck(item: productId));
      },
    );
    return BlocListener<CartScreenBloc, CartScreenState>(
      listener: (context, state) {
        if (state.cartAdded) {
          Fluttertoast.showToast(msg: 'Product Added to Cart');
        }
      },
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
              bottomNavigationBar: BlocBuilder<CartScreenBloc, CartScreenState>(
                builder: (context, state) {
                  final count = state.itemCount;
                  final productPrice = product.price!.toInt();
                  final finalPrice = count * productPrice;
                  return BottomButton(
                    productCount: state.itemCount,
                    productPrice: finalPrice,
                    product: product,
                  );
                },
              ),
            );
          }
          return const Spacer();
        },
      ),
    );
  }
}
