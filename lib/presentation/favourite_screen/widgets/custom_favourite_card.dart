import 'package:e_comerce_app_ui/application/favourite_screen/favourite_screen_bloc.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/db/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavouriteCard extends StatelessWidget {
  const CustomFavouriteCard({
    Key? key,
    required this.productImage,
    required this.productTitle,
    required this.productDescription,
    required this.produtPrice,
    required this.product,
  }) : super(key: key);

  final String productImage;
  final String productTitle;
  final String productDescription;
  final String produtPrice;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        elevation: 0,
        shadowColor: orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              color: offWhite,
              child: Image.network(productImage),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 25,
                        color: textBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productDescription,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: offBlack,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    produtPrice,
                    style: const TextStyle(
                      color: orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  context.read<FavouriteScreenBloc>().add(
                      FavouriteItemRemoved(item: product, isFavourite: false));
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
