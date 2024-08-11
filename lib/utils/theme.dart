// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: const Color(0xffF76C6A),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.white,
    // appBarTheme: lightAppBarTheme,
    iconTheme: const IconThemeData(color: Color(0xffF76C6A), size: 25),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
          fontSize: 14,fontWeight: FontWeight.w600,
          color: Color(0xff91919F)
      ),
      titleLarge: GoogleFonts.inter(
          fontSize: 40,fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xffFCFCFC)
      ),
        labelMedium: GoogleFonts.inter(
        fontSize: 22,fontWeight: FontWeight.w600,color: Color(0xffFCFCFC)
      ),
      bodySmall:  GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1),
      headlineSmall: GoogleFonts.inter(
          color:  Color(0xffF76C6A),
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5
      )
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      onPrimary: Color(0xffF76C6A),
        tertiary:Colors.black,
        tertiaryContainer: Color(0xff00A86B)
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: const Color(0xffF76C6A),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Color(0xffF76C6A), size: 22),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
          fontSize: 14,fontWeight: FontWeight.w600,
          color: Color(0xff91919F)
      ),
      titleLarge: GoogleFonts.inter(
          fontSize: 40,fontWeight: FontWeight.w600,
          color: Colors.white
      ),
        labelSmall: GoogleFonts.inter(
            fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xffFCFCFC)
        ),
        labelMedium: GoogleFonts.inter(
            fontSize: 22,fontWeight: FontWeight.w600,color: Color(0xffFCFCFC)
        ),
        bodySmall:  GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1),
        headlineSmall: GoogleFonts.inter(
            color:  Color(0xffF76C6A),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5
        )
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      tertiary:Colors.white,
        onPrimary: Color(0xffF76C6A),
      tertiaryContainer: Color(0xff00A86B)
    ),
  );
}
