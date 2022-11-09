import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/custom_offer_card.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/custom_service_card_area.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/see_more_action_button.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/special_item_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: CustomScrollView(
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
                SizedBox(
                  height: 200,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.circular(20)),
                          width: 150,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.circular(20)),
                          width: 150,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.circular(20)),
                          width: 150,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.circular(20)),
                          width: 150,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
