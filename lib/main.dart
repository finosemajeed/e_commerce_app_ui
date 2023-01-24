import 'package:e_comerce_app_ui/application/cart_screen/cart_screen_bloc.dart';
import 'package:e_comerce_app_ui/application/favourite_screen/favourite_screen_bloc.dart';
import 'package:e_comerce_app_ui/application/home_screen/products_bloc.dart';
import 'package:e_comerce_app_ui/infrastructure/authentication/authentication_service.dart';
import 'package:e_comerce_app_ui/presentation/login_screen/login_screen.dart';
import 'package:e_comerce_app_ui/presentation/navigation_screen/navigation_screen.dart';
import 'package:e_comerce_app_ui/presentation/profile_view_screen/profile_view_screen.dart';
import 'package:e_comerce_app_ui/presentation/search_screen/search_screen.dart';
import 'package:e_comerce_app_ui/presentation/splash_screen/spalash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'presentation/cart_screen/cart_screen.dart';
import 'presentation/favourite_screen/favourite_screen.dart';
import 'presentation/home_screen/home_screen.dart';
import 'presentation/notification_screen/notifcation_screen.dart';
import 'presentation/profile_screen/profile_screen.dart';
import 'presentation/signup_screen/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsListBloc>(
            create: ((context) => ProductsListBloc()..add(FetchProducts()))),
        BlocProvider<CartScreenBloc>(
            create: ((context) => CartScreenBloc()..add(CartStarted()))),
        BlocProvider<FavouriteScreenBloc>(
            create: ((context) =>
                FavouriteScreenBloc()..add(FavouriteStarted())))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: AuthentificationService().authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainScreen();
            } else {
              return const LoginScreen();
            }
          },
        ),
        routes: {
          '/search_screen': (context) => const SearchScreen(),
          '/splash_screen': ((context) => const SplashScreen()),
          '/signup_screen': (context) => SignUpScreen(),
          '/profile_screen': (context) => ProfileScreen(),
          '/notification_screen': (context) => NotificationScreen(),
          '/main_screen': (context) => MainScreen(),
          '/login_screen': (context) => const LoginScreen(),
          // '/product_view_screen': (context) => ProductViewScreen(),
          '/home_screen': (context) => const HomeScreen(),
          '/favourite_screen': (context) => const FavouriteScreen(),
          '/cart_screen': (context) => const CartScreen(),
          '/profile_view_screen': (context) => ProfileViewScreen()
        },
      ),
    );
  }
}
