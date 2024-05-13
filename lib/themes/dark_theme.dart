import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mero_weather/themes/text_theme.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  textTheme: myTextTheme,
  fontFamily: GoogleFonts.inter().fontFamily!,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  ),
);
