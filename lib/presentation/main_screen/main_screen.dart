import 'package:e_comerce_app_ui/presentation/main_screen/widgets/widgets_navigation.dart';
import 'package:e_comerce_app_ui/presentation/widgets/widgets_screens.dart';

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
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: ValueListenableBuilder(
        builder: ((context, value, _) => _pages[value]),
        valueListenable: indexChangeNotifier,
      ),
      bottomNavigationBar: const CustomBottomNavigatonBar(),
    );
  }
}
