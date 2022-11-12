import 'package:e_comerce_app_ui/presentation/home_screen/widgets/product_card_list.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/widgets/see_more_action_button.dart';
import 'package:e_comerce_app_ui/presentation/search_screen/widgets/result_badge.dart';
import 'package:e_comerce_app_ui/presentation/widgets/appbar_icon.dart';
import 'package:e_comerce_app_ui/presentation/widgets/product_card.dart';
import 'package:e_comerce_app_ui/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const SearchField(),
        actions: const [
          AppbarIcon(icon: Icons.sort),
          SizedBox(width: 10),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ResultBadge(
                  text: 'showing',
                  results: '12',
                  searchItem: 'Tshirts for men',
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (MediaQuery.of(context).size.width) /
                        (MediaQuery.of(context).size.height / 1.4),
                    crossAxisCount: 2,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) => const ProductCard(
                    image: 'assets/products/tshirt.png',
                    title: 'Tshirt',
                    price: '299',
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
