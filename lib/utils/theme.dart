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
          color: const Color(0xff91919F)
      ),
      titleLarge: GoogleFonts.inter(
          fontSize: 40,fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 14,fontWeight: FontWeight.w600,color: const Color(0xffFCFCFC)
      ),
        labelMedium: GoogleFonts.inter(
        fontSize: 22,fontWeight: FontWeight.w600,color: const Color(0xffFCFCFC)
      ),
      bodySmall:  GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1),
      headlineSmall: GoogleFonts.inter(
          color:  const Color(0xffF76C6A),
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5
      ),
      headlineLarge: GoogleFonts.inter(
          color:  Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5
      ),
      labelLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 32,
      ),
      titleMedium: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600),
      displaySmall: GoogleFonts.inter(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16
      ),
      bodyMedium: GoogleFonts.dmSans(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      onPrimary: const Color(0xffF76C6A),
        tertiary:Colors.black,
        surfaceBright: const Color(0xffF2F2F2),
        tertiaryContainer: const Color(0xff00A86B)
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
          color: const Color(0xff91919F)
      ),
      titleLarge: GoogleFonts.inter(
          fontSize: 40,fontWeight: FontWeight.w600,
          color: Colors.white
      ),
        labelSmall: GoogleFonts.inter(
            fontSize: 14,fontWeight: FontWeight.w600,color: const Color(0xffFCFCFC)
        ),
        labelMedium: GoogleFonts.inter(
            fontSize: 22,fontWeight: FontWeight.w600,color: const Color(0xffFCFCFC)
        ),
        bodySmall:  GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1),
        headlineSmall: GoogleFonts.inter(
            color:  const Color(0xffF76C6A),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5
        ),
      headlineLarge: GoogleFonts.inter(
          color:  Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5
      ),
      labelLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 32,
      ),
      titleMedium: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600),
      displaySmall: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16
      ),
      bodyMedium: GoogleFonts.dmSans(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      tertiary:Colors.white,
        surfaceBright: const Color(0xff252525),
        onPrimary: const Color(0xffF76C6A),
      tertiaryContainer: const Color(0xff00A86B)
    ),
  );
}
