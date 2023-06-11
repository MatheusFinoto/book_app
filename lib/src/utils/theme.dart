// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color primary100 = const Color(0xff8FBF9F);
  static Color primary200 = const Color(0xff68a67d);
  static Color primary300 = const Color(0xff24613b);
  static Color accent100 = const Color(0xffF18F01);
  static Color accent200 = const Color(0xff833500);
  static Color text100 = const Color(0xff353535);
  static Color text200 = const Color(0xff5f5f5f);
  static Color bg100 = const Color(0xffF5ECD7);
  static Color bg200 = const Color(0xffebe2cd);
  static Color bg300 = const Color(0xffc2baa6);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: bg200,
    cardColor: bg100,
    iconTheme: const IconThemeData(
      color: Colors.black54,
    ),
    colorSchemeSeed: primary200,
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData(brightness: Brightness.light).textTheme,
    ).copyWith(
      titleLarge: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      titleMedium: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      titleSmall: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
      bodySmall: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black54),
      labelSmall: GoogleFonts.poppins(
          fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black45),
    ),
  );
}
