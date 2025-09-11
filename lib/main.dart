
import 'package:best_seller_2/features/login/screen/login_screen.dart';
import 'package:best_seller_2/features/signup/bloc/sign_up_bloc.dart';
import 'package:best_seller_2/features/signup/repository/sign_up_repository.dart';
import 'package:best_seller_2/features/signup/screen/sign_up_screen.dart';
import 'package:best_seller_2/features/splash/screen/splash_screen.dart';
import 'package:best_seller_2/home.dart';
import 'package:best_seller_2/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<SignUpBloc>(SignUpBloc());
  GetIt.I.registerSingleton<SignUpRepository>(SignUpRepository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashScreen(),
        '/account': (context) => SignUpScreen(),
        '/login'  : (context) => LoginScreen(),
        '/home' : (context) => HomePage()
      },
      title: 'Best Seller',
      theme: app_theme,
    );
  }
}