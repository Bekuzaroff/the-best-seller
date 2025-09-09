
import 'package:best_seller_2/features/splash/screen/splash_screen.dart';
import 'package:best_seller_2/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
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
      },
      title: 'Best Seller',
      theme: app_theme,
    );
  }
}