import 'package:asir_stamps_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF20233F);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textLightBlue = Color(0xFF5998F6);
  static final Color textGrey = Color(0xFF000000).withValues(alpha: 0.5);

  // Background Colors
  static const Color background = Color(0xFF20233F);
  static const Color navbarBackground = Color(0xFF475E94);
  static final Color scaffoldBackground = Colors.grey[50]!;
  static const Color primarySecondaryBackground = Color(0xFF122F5B);
  static const Color primarySecondary = Color(0xFF0E3D67);
  static const Color timelineBackground = Color(0xFFF8F8F8);
  static const Color timelineActive = Color(0xFF3A86FF);
  static final Color timelineInactive = Colors.grey[400]!;
  static final Color timelineLine = Colors.grey[300]!;

  // Account Screen Colors
  static const Color accountGreen = Color(0xFF305434);
  static const Color accountBlue = Color(0xFF2F3142);
  static final Color accountGray = Colors.grey[600]!;

  // Discover Screen Colors
  static const Color discoverBlue = Color(0xFF3A5199);

  // Custom Header Colors
  static const Color headerDarkBlue = Color(0xFF3A5173);
  static const Color headerLightBlue = Color(0xFF4C78A8);

  // Stamp Colors
  static const Color stampGold = Color(0xFFFFD700);
  static const Color stampSilver = Color(0xFFC0C0C0);
  static const Color stampBronze = Color(0xFFCD7F32);

  // Stamp Gradients
  static const LinearGradient stampGoldGradient = LinearGradient(
    colors: [Color(0xFFE7AA12), Color(0xFFFAD475)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  static const LinearGradient stampSilverGradient = LinearGradient(
    colors: [Color(0xFF6B6A7B), Color(0xFFB6C0D6)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  static const LinearGradient stampBronzeGradient = LinearGradient(
    colors: [Color(0xFFA3877C), Color(0xFFC5B49D)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  // Theme Data
  static ThemeData get lightTheme => ThemeData(
    primaryColor: primary,
    fontFamily: AppFonts.fontFamily,
    scaffoldBackgroundColor: scaffoldBackground,
    cardColor: scaffoldBackground,
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return navbarBackground;
        }
        return null;
      }),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: navbarBackground,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: navbarBackground,
        foregroundColor: Colors.white,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
  );
}
