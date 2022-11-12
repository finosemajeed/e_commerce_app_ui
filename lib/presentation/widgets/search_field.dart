import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/core/strings.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        Navigator.of(context).pushNamed('/searchScreen');
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
