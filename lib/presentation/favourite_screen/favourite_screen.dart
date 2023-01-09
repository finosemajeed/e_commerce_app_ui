import 'package:e_comerce_app_ui/db/data_model.dart';
import 'package:e_comerce_app_ui/presentation/favourite_screen/widgets/custom_favourite_card.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favorite List',
            style: TextStyle(color: Colors.black54),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                semanticLabel: '5',
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: ((context, index) {
            return CustomFavouriteCard(
              productDescription:
                  productDetails[index].productDetails.toString(),
              productImage: productDetails[index].productImage.toString(),
              productTitle: productDetails[index].productName.toString(),
              produtPrice: productDetails[index].productPrice.toString(),
            );
          }),
        ));
  }
}
