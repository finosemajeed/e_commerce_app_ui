import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class SeeMoreActionButton extends StatelessWidget {
  const SeeMoreActionButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'See more',
                style: TextStyle(color: offBlack),
              ))
        ],
      ),
    );
  }
}
