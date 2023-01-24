// ignore_for_file: must_be_immutable

import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  AppbarIcon({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final IconData icon;
  Function press;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 26,
      backgroundColor: offWhite,
      child: IconButton(
          onPressed: () {
            press;
          },
          icon: Icon(
            icon,
            color: offBlack,
          )),
    );
  }
}
