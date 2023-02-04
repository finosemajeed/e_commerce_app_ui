import 'package:e_comerce_app_ui/application/search_screen/search_screen_bloc.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/widgets_home.dart';

import 'package:e_comerce_app_ui/presentation/widgets/search_field.dart';
import 'package:e_comerce_app_ui/presentation/widgets/widgets_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     context.read<SearchScreenBloc>().add(const Initilize());
    //   },
    // );

    return BlocConsumer<SearchScreenBloc, SearchScreenState>(
      listener: (context, state) {
        // if (state.searchResultList.isNotEmpty) {
        //   Navigator.of(context).pushNamed('/search_screen');
        // }
      },
      builder: (context, state) {
        return state.searchResultList.isEmpty
            ? Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  toolbarHeight: 100,
                  title: const SearchField(),
                  actions: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: offWhite,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/cart_screen');
                          },
                          icon: const Icon(
                            Icons.local_grocery_store_outlined,
                            color: offBlack,
                          )),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: offWhite,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/notification_screen');
                          },
                          icon: const Icon(
                            Icons.notifications,
                            color: offBlack,
                          )),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            GestureDetector(
                              child: const CustomOfferCard(),
                              onTap: () {
                                // context.read<ProductsBloc>().add(FetchProducts());
                              },
                            ),
                            const CustomServiceCardArea(),
                            const SeeMoreActionButton(text: 'Special for you'),
                            const SpecialItemCard(),
                            const SeeMoreActionButton(text: 'Popular Product'),
                            const ProductCardList(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const SearchScreen();
      },
    );
  }
}
