import 'package:e_comerce_app_ui/presentation/home_screen/home_screen.dart';
import 'package:e_comerce_app_ui/presentation/widgets/appbar_icon.dart';
import 'package:e_comerce_app_ui/presentation/navigation_screen/widgets/custom_bottom_navigatoin_bar.dart';
import 'package:e_comerce_app_ui/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

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
      body: const HomeScreen(),
      bottomNavigationBar: const CustomBottomNavigatonBar(),
    );
  }
}
