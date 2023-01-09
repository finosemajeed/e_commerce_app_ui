import 'dart:developer';

import 'package:e_comerce_app_ui/presentation/favourite_screen/favourite_screen.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/custom_offer_card.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/custom_service_card_area.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/product_card_list.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/see_more_action_button.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/special_item_card.dart';
import 'package:e_comerce_app_ui/presentation/profile_screen/profile_screen.dart';
import 'package:e_comerce_app_ui/presentation/widgets/appbar_icon.dart';
import 'package:e_comerce_app_ui/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: const SearchField(),
        actions: [
          AppbarIcon(
            icon: Icons.favorite_border,
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => ProfileScreen())));
              log("icon pressed");
            },
          ),
          const SizedBox(width: 10),
          AppbarIcon(
            icon: Icons.notifications,
            press: () {},
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
                  const CustomOfferCard(),
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
    );
  }
}
