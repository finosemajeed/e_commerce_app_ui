import 'dart:async';

import 'package:e_comerce_app_ui/infrastructure/authentication/authentication_service.dart';
import 'package:e_comerce_app_ui/presentation/widgets/widgets_screens.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () =>
            // isLoggedIn
            //     ? Navigator.of(context).pushReplacementNamed('/main_screen')
            //     :
            StreamBuilder(
              stream: AuthentificationService().authStateChanges,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const LoginScreen();
                } else {
                  return MainScreen();
                }
              },
            ));
    // Navigator.of(context).pushReplacementNamed('/login_screen'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Lottie.asset(
        'assets/splash_screen/splash_animation.json',
        repeat: false,
        fit: BoxFit.fill,
      ),
    );
  }
}
