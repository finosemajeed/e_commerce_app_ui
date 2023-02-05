import 'dart:developer';

import 'package:e_comerce_app_ui/application/home_screen/products_bloc.dart';
import 'package:e_comerce_app_ui/presentation/product_view_screen/product_view_screen.dart';
import 'package:e_comerce_app_ui/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCardList extends StatelessWidget {
  const ProductCardList(
      {Key? key, this.direction = Axis.horizontal, this.productCount = 0})
      : super(key: key);
  final direction;
  final productCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: BlocBuilder<ProductsListBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoaded) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                scrollDirection: direction,
                itemCount:
                    productCount <= 0 ? state.productList.length : productCount,
                itemBuilder: (context, index) {
                  final product = state.productList[index];
                  log(index.toString());
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => ProductViewScreen(
                                productId: product.id!,
                              ))));
                    },
                    child: ProductCard(
                      image: product.image.toString(),
                      title: product.title.toString(),
                      price: product.price,
                    ),
                  );
                });
          }
          if (state is ProductListError) {
            return const Center(
              child: Text('Products are not loading'),
            );
          }
          return const Spacer();
        },
      ),
    );
  }
}
