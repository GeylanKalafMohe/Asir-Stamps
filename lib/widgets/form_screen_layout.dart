import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class FormScreenLayout extends StatelessWidget {
  final Widget logo;
  final Widget content;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool showBackButton;
  final EdgeInsetsGeometry padding;

  const FormScreenLayout({
    super.key,
    required this.logo,
    required this.content,
    required this.buttonText,
    required this.onButtonPressed,
    this.showBackButton = true,
    this.padding = const EdgeInsets.all(24),
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Fixed background gradient
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [AppColors.primary, AppColors.headerLightBlue],
                  ),
                ),
              ),
              // Scrollable content
              SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  padding: padding,
                  child: Column(
                    children: [
                      logo,
                      // Form Container
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                content,
                                const SizedBox(height: 24),
                                // Action Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: onButtonPressed,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF1D61E7),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      buttonText,
                                      style: AppFonts.bodyLarge.copyWith(
                                        color: Colors.white,
                                        fontWeight: AppFonts.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (showBackButton)
                            PositionedDirectional(
                              start: 0,
                              top: 0,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: AppColors.navbarBackground,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
