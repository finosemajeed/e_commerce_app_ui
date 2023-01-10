import 'package:e_comerce_app_ui/presentation/search_screen/search_screen.dart';
import 'package:e_comerce_app_ui/presentation/splash_screen/spalash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/searchScreen': (context) => const SearchScreen(),
      },
    );
  }
}
