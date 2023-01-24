import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class ResultBadge extends StatelessWidget {
  const ResultBadge({
    Key? key,
    required this.text,
    required this.results,
    required this.searchItem,
  }) : super(key: key);
  final String text;
  final String results;
  final String searchItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            spacing: 5,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: offBlack,
                ),
              ),
              Text(
                searchItem,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: textBlack,
                ),
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                '$results Results',
                style: const TextStyle(color: offBlack, fontSize: 18),
              ))
        ],
      ),
    );
  }
}
