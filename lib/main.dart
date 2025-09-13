
import 'package:best_seller_2/features/auth/bloc/login/login_bloc.dart';
import 'package:best_seller_2/features/auth/repository/login_repository.dart';
import 'package:best_seller_2/features/auth/screens/login_screen.dart';
import 'package:best_seller_2/features/auth/bloc/signup/sign_up_bloc.dart';
import 'package:best_seller_2/features/auth/repository/sign_up_repository.dart';
import 'package:best_seller_2/features/auth/screens/sign_up_screen.dart';
import 'package:best_seller_2/features/splash/screen/splash_screen.dart';
import 'package:best_seller_2/home.dart';
import 'package:best_seller_2/shared/prefs/service_locator.dart';
import 'package:best_seller_2/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  GetIt.I.registerSingleton<SignUpBloc>(SignUpBloc());
  GetIt.I.registerSingleton<LoginBloc>(LoginBloc());
  GetIt.I.registerSingleton<SignUpRepository>(SignUpRepository());
  GetIt.I.registerSingleton<LoginRepository>(LoginRepository());
  WidgetsFlutterBinding.ensureInitialized();
  await setup_locator();

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