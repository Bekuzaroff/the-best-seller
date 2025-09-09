import 'package:flutter/material.dart';

ThemeData app_theme = ThemeData(
        cardTheme: CardThemeData(
          color: Color(0xFF2B2A2A),
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Colors.grey.shade800,
          thickness: 1,
        ),
        primaryColor: Color(0xFF66FF7D),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF202020)
      );