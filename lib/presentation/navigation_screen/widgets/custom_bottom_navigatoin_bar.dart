import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

ValueNotifier indexChangeNotifier = ValueNotifier(0);

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
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, newIndex, _) {
            return BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: newIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: orange,
              unselectedItemColor: offBlack,
              onTap: (index) {
                indexChangeNotifier.value = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: "My Favourite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.widgets),
                  label: "more",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity_outlined),
                  label: "Account",
                ),
              ],
            );
          },
        ));
  }
}
