import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 2), () {
    //   Navigator.pushReplacementNamed(context, '/account');
    // });

    return Scaffold(
      body: Center(
      child: SvgPicture.asset('assets/logo.svg', width: 75)
      ));
  }
}