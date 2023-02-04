import 'package:e_comerce_app_ui/application/cart_screen/cart_screen_bloc.dart';
import 'package:e_comerce_app_ui/application/favourite_screen/favourite_screen_bloc.dart';
import 'package:e_comerce_app_ui/application/home_screen/products_bloc.dart';
import 'package:e_comerce_app_ui/application/search_screen/search_screen_bloc.dart';
import 'package:e_comerce_app_ui/infrastructure/authentication/authentication_service.dart';
import 'package:e_comerce_app_ui/presentation/widgets/widgets_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsListBloc>(
            create: ((context) => ProductsListBloc()..add(FetchProducts()))),
        BlocProvider<CartScreenBloc>(
            create: ((context) => CartScreenBloc()..add(const Started()))),
        BlocProvider<FavouriteScreenBloc>(
            create: ((context) =>
                FavouriteScreenBloc()..add(const FavouriteInitial()))),
        BlocProvider<SearchScreenBloc>(
            create: (context) => SearchScreenBloc()..add(const Initilize()))
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
          '/profile_view_screen': (context) => const ProfileViewScreen()
        },
      ),
    );
  }
}
