import 'package:asir_stamps_app/screens/login_screen.dart';
import 'package:asir_stamps_app/screens/onboarding/onboarding_screen.dart';
import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:asir_stamps_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final onboardingCompleted =
        prefs.getBool('onboarding_is_completed') ?? false;

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => onboardingCompleted
              ? const LoginScreen()
              : const OnboardingScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final circleSize = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        toolbarHeight: -20,
      ),
      body: Stack(
        children: [
          // Background circles
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: -circleSize / 2,
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: const BoxDecoration(
                color: Color(0xFF141409),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 80 + MediaQuery.of(context).padding.top,
            right: -circleSize / 1.5,
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: const BoxDecoration(
                color: Color(0xFF475E94),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Bottom right logo booklet
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/images/hackathon_logo_booklet.png'),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/hackathon_logo.png',
                  width: 300,
                  height: 100,
                ),
                const SizedBox(height: 24),
                Text(
                  'أهلا بك في',
                  style: AppFonts.custom(
                    fontWeight: AppFonts.regular,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'ختوم عسير',
                  style: AppFonts.custom(
                    fontWeight: AppFonts.regular,
                    fontSize: 60,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
