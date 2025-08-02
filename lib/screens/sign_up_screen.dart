import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

// Placeholder for RegisterScreen
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Register', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text(
          'Registration Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
