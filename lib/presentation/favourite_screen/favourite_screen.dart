import 'package:e_comerce_app_ui/application/favourite_screen/favourite_screen_bloc.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/favourite_screen/widgets/custom_favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: offBlack),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'My favourite',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocConsumer<FavouriteScreenBloc, FavouriteScreenState>(
              listener: (context, state) {
                if (state is FavouriteRemoved) {
                  Fluttertoast.showToast(
                      msg: 'Product removed from favourites');
                }
              },
              builder: (context, state) {
                if (state is FavouriteLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FavouriteLoaded) {
                  final favouriteItem = state.favouriteItems;
                  if (favouriteItem!.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: favouriteItem.length,
                        itemBuilder: ((context, index) {
                          return CustomFavouriteCard(
                            productDescription:
                                favouriteItem[index].description.toString(),
                            productImage: favouriteItem[index].image.toString(),
                            productTitle: favouriteItem[index].title.toString(),
                            produtPrice: favouriteItem[index].price.toString(),
                            product: favouriteItem[index],
                          );
                        }),
                      ),
                    );
                  } else if (favouriteItem.isEmpty) {
                    return const Center(
                      child: Text('Your cart is empty'),
                    );
                  }
                }
                return const Spacer();
              },
            )
          ],
        ));
  }
}
