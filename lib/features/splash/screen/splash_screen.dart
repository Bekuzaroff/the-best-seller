import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      final token = GetIt.I<SharedPreferences>().getString('access_token');
      Navigator.pushReplacementNamed(context, token == null ? '/account' : '/home');
    });

    return Scaffold(
      body: Center(
      child: SvgPicture.asset('assets/logo.svg', width: 75)
      ));
  }
}