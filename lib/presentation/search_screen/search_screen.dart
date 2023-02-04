import 'package:e_comerce_app_ui/application/search_screen/search_screen_bloc.dart';
import 'package:e_comerce_app_ui/presentation/search_screen/widgets/widgets_search.dart';

import 'package:e_comerce_app_ui/presentation/widgets/appbar_icon.dart';
import 'package:e_comerce_app_ui/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) {
    //     context.read<SearchScreenBloc>().add(const Initilize());
    //   },
    // );
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
      builder: (context, state) {
        final searchItems = state.searchResultList;
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            // title: const SearchField(),
            actions: [
              AppbarIcon(
                icon: Icons.sort,
                press: () {},
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ResultBadge(
                      text: 'showing',
                      results: searchItems.length.toString(),
                      searchItem: state.searchQuery,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const PageScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (MediaQuery.of(context).size.width) /
                            (MediaQuery.of(context).size.height / 1.4),
                        crossAxisCount: 2,
                      ),
                      itemCount: searchItems.length,
                      itemBuilder: (context, index) => ProductCard(
                        image: searchItems[index].image.toString(),
                        title: searchItems[index].title.toString(),
                        price: searchItems[index].price,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
