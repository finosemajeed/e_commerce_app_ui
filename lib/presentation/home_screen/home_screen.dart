import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/cart_screen/cart_screen.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/custom_offer_card.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/custom_service_card_area.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/product_card_list.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/see_more_action_button.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/special_item_card.dart';
import 'package:e_comerce_app_ui/presentation/notification_screen/notifcation_screen.dart';
import 'package:e_comerce_app_ui/presentation/widgets/appbar_icon.dart';
import 'package:e_comerce_app_ui/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const CartScreen())));
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => NotificationScreen())));
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
