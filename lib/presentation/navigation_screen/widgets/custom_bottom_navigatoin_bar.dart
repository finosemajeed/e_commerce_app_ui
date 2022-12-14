import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigatonBar extends StatelessWidget {
  const CustomBottomNavigatonBar({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0), // adjust to your liking
        topRight: Radius.circular(20.0), // adjust to your liking
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: orange,
        unselectedItemColor: offBlack,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined),
            label: "home",
          ),
        ],
      ),
    );
  }
}
