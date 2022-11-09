import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    this.text,
    required this.icon,
  }) : super(key: key);

  final text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: offOrange,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          width: 60,
          child: Center(
              child: Icon(
            icon,
            color: orange,
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            color: offBlack,
          ),
        )
      ],
    );
  }
}
