import 'package:e_comerce_app_ui/presentation/favourite_screen/favourite_screen.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/home_screen.dart';
import 'package:e_comerce_app_ui/presentation/notificaation_screen/notifcation_screen.dart';
import 'package:e_comerce_app_ui/presentation/profile_screen/profile_screen.dart';
import 'package:e_comerce_app_ui/presentation/widgets/appbar_icon.dart';
import 'package:e_comerce_app_ui/presentation/navigation_screen/widgets/custom_bottom_navigatoin_bar.dart';
import 'package:e_comerce_app_ui/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  final _pages = [
    HomeScreen(),
    FavouriteScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const SearchField(),
        actions: const [
          AppbarIcon(icon: Icons.card_travel),
          SizedBox(width: 10),
          AppbarIcon(icon: Icons.notifications),
          SizedBox(width: 10),
        ],
      ),
      body: ValueListenableBuilder(
        builder: ((context, value, _) => _pages[value]),
        valueListenable: indexChangeNotifier,
      ),
      bottomNavigationBar: const CustomBottomNavigatonBar(),
    );
  }
}
