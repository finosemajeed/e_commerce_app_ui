import 'package:e_comerce_app_ui/presentation/favourite_screen/favourite_screen.dart';
import 'package:e_comerce_app_ui/presentation/home_screen/home_screen.dart';
import 'package:e_comerce_app_ui/presentation/notification_screen/notifcation_screen.dart';
import 'package:e_comerce_app_ui/presentation/profile_screen/profile_screen.dart';
import 'package:e_comerce_app_ui/presentation/navigation_screen/widgets/custom_bottom_navigatoin_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _pages = [
    const HomeScreen(),
    const FavouriteScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ValueListenableBuilder(
        builder: ((context, value, _) => _pages[value]),
        valueListenable: indexChangeNotifier,
      ),
      bottomNavigationBar: const CustomBottomNavigatonBar(),
    );
  }
}
