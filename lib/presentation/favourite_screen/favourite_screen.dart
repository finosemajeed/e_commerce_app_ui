import 'package:e_comerce_app_ui/application/favourite_screen/favourite_screen_bloc.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/favourite_screen/widgets/widget_favourite.dart';
import 'package:e_comerce_app_ui/presentation/widgets/product_loading.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: offBlack),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: BlocBuilder<FavouriteScreenBloc, FavouriteScreenState>(
                builder: (context, state) {
                  return Badge(
                    label: Text(state.favouriteItems?.length.toString() ?? '0'),
                    backgroundColor: Colors.white,
                    textColor: Colors.red,
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ],
          title: const Text(
            'My favourite',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<FavouriteScreenBloc, FavouriteScreenState>(
              listener: (context, state) {
                if (state.favouriteRemoved) {
                  Fluttertoast.showToast(
                      msg: 'Product removed from favourites');
                }
              },
              builder: (context, state) {
                final favouriteItem = state.favouriteItems;
                if (state.isLoading) {
                  return Column(
                    children: const [
                      ProductLoading(),
                      ProductLoading(),
                    ],
                  );
                }
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15),
                      LottieBuilder.asset(
                        'assets/lottie_animation/empty_box.json',
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.width / 1.5,
                      ),
                      const Center(
                        child: Text(
                          'Favourite is empty',
                          style: TextStyle(
                            color: offOrange,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return const Spacer();
              },
            )
          ],
        ));
  }
}
