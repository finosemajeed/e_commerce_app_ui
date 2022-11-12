import 'package:e_comerce_app_ui/presentation/search_screen/search_screen.dart';
import 'package:e_comerce_app_ui/presentation/splash_screen/spalash_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/searchScreen': (context) => SearchScreen(),
      },
    );
  }
}
