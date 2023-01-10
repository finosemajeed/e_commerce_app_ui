import 'dart:async';

import 'package:e_comerce_app_ui/domain/global/global_data.dart';
import 'package:e_comerce_app_ui/domain/login_screen/login_auth_function.dart';
import 'package:e_comerce_app_ui/presentation/login_screen/login_screen.dart';
import 'package:e_comerce_app_ui/presentation/navigation_screen/navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override


  void initState() {
    checkLogin();
    Timer(
        const Duration(seconds: 2),
        () => isLoggedIn
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => NavigationScreen())))
            :
            // StreamBuilder(
            //       stream: FirebaseAuth.instance.authStateChanges(),
            //       builder: (context, snapshot) {
            //         if (snapshot.hasData) {
            //           return LoginScreen();
            //         } else {
            //           return NavigationScreen();
            //         }
            //       },
            //     ));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => LoginScreen()))));
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
