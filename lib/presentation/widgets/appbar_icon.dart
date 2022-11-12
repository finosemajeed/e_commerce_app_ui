import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 26,
      backgroundColor: offWhite,
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: offBlack,
          )),
    );
  }
}
