import 'package:flutter/material.dart';

class AppFonts {
  // Font family
  static const String fontFamily = 'IBMPlexSansArabic';

  // Font weights
  static const FontWeight extraLight = FontWeight.w100;
  static const FontWeight thin = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Text styles for different use cases
  static const TextStyle heading1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36,
    fontWeight: bold,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: semiBold,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: medium,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: regular,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: regular,
  );

  static const TextStyle bodyTiny = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: regular,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regular,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: light,
  );

  // Custom text style builder
  static TextStyle custom({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight ?? regular,
      color: color ?? Colors.white,
      decoration: decoration,
      height: height,
    );
  }
}
