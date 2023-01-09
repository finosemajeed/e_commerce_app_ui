import 'package:e_comerce_app_ui/presentation/profile_screen/widgets/custom_tile.dart';
import 'package:e_comerce_app_ui/presentation/profile_screen/widgets/help_card.dart';
import 'package:e_comerce_app_ui/presentation/profile_screen/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ProfileTile(
            userName: 'Hattie Hall',
            profileImage: 'assets/images/gaming.jfif',
          ),
          const Divider(),
          const CustomTile(tittle: 'Profile', icon: Icons.person_outline),
          const CustomTile(tittle: 'My Cards', icon: Icons.call_to_action),
          const CustomTile(tittle: 'History', icon: Icons.widgets_outlined),
          const CustomTile(tittle: 'Profile', icon: Icons.person_outline),
          const CustomTile(tittle: 'Settings', icon: Icons.settings),
          const HelpCard(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Privacy policy',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Text(
                'English',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Text(
            '© finose majeed 2023',
            style: TextStyle(
              color: Colors.black26,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
