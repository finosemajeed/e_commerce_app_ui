
import 'package:e_comerce_app_ui/application/search_screen/search_screen_bloc.dart';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/core/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<SearchScreenBloc>().add(const Initilize());
      },
    );
    return TextFormField(
      onChanged: (data) {
        context
            .read<SearchScreenBloc>()
            .add(SearchProduct(productQuerry: data.toString()));
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: offWhite)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: offWhite)),
        filled: true,
        fillColor: offWhite,
        hintText: search,
        hintStyle: const TextStyle(color: offBlack),
        prefixIcon: const Icon(Icons.search, color: offBlack),
      ),
    );
  }
}
