import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class SeeMoreActionButton extends StatelessWidget {
  const SeeMoreActionButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color.fromARGB(177, 0, 0, 0)),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'See more',
                style: TextStyle(color: offBlack, fontSize: 18),
              ))
        ],
      ),
    );
  }
}
