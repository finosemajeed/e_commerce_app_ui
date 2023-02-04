import 'package:e_comerce_app_ui/presentation/profile_screen/widgets/widgets_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final userCredential = FirebaseAuth.instance.currentUser;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileTile(
            userName: userCredential!.displayName.toString(),
            profileImage: 'assets/images/gaming.jfif',
          ),
          const Divider(),
          GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed('/profile_view_screen'),
              child: const CustomTile(
                  title: 'Profile', icon: Icons.person_outline)),
          const CustomTile(title: 'My Cards', icon: Icons.call_to_action),
          const CustomTile(title: 'History', icon: Icons.widgets_outlined),
          const CustomTile(title: 'Settings', icon: Icons.settings),
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
