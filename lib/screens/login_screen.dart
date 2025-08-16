import 'package:asir_stamps_app/screens/main_tab_screen.dart';
import 'package:asir_stamps_app/screens/partner_loyalty/partner_loyalty_screen.dart';
import 'package:asir_stamps_app/screens/sign_up/sign_up_screen.dart';
import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController(
    text: 'asirstamps@gmail.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'asirstamps@gmail.com',
  );
  bool _obscurePassword = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Check if partner email
      if (_usernameController.text.trim() == '1asirstamps@gmail.com') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PartnerLoyaltyScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainTabScreen()),
        );
      }
    }
  }

  void _socialLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainTabScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textfieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: AppColors.textPrimary, width: 2),
    );
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        toolbarHeight: -20,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  AppImages.loginBg,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 32.0,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 32),
                          Center(
                            child: Image.asset(
                              AppIcons.hackathonLogo2,
                              width: 200,
                            ),
                          ),
                          const SizedBox(height: 48),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _usernameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'الرجاء إدخال اسم المستخدم أو الإيميل';
                                    }
                                    return null;
                                  },
                                  style: AppFonts.bodyMedium.copyWith(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    errorMaxLines: 3,
                                    errorStyle: const TextStyle(
                                      color: Color.fromARGB(255, 252, 153, 153),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: AppColors.textPrimary,
                                    ),
                                    hintText: 'اسم المستخدم أو الإيميل',
                                    hintStyle: AppFonts.bodyMedium.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                    enabledBorder: textfieldBorder,
                                    border: textfieldBorder,
                                    focusedBorder: textfieldBorder,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscurePassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'الرجاء إدخال كلمة المرور';
                                    }
                                    return null;
                                  },
                                  style: AppFonts.bodyMedium.copyWith(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    errorMaxLines: 3,
                                    errorStyle: const TextStyle(
                                      color: Color.fromARGB(255, 252, 153, 153),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: AppColors.textPrimary,
                                    ),
                                    hintText: 'كلمة المرور',
                                    hintStyle: AppFonts.bodyMedium.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                    enabledBorder: textfieldBorder,
                                    border: textfieldBorder,
                                    focusedBorder: textfieldBorder,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: AppColors.textPrimary,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // TODO: Add forgot password logic
                                },
                                child: Text(
                                  'نسيت كلمة المرور؟',
                                  style: AppFonts.bodySmall.copyWith(
                                    color: AppColors.textLightBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.textPrimary,
                                foregroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 13,
                                ),
                                textStyle: AppFonts.bodyLarge.copyWith(
                                  color: AppColors.primary,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: _login,
                              child: const Text('تسجيل الدخول'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      AppImages.shalalah,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Text(
                            'أو سجل الدخول باستخدام:',
                            style: AppFonts.bodySmall.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 14),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _SocialLoginButton(
                                icon: AppIcons.linkedin,
                                onTap: _socialLogin,
                              ),
                              _SocialLoginButton(
                                icon: AppIcons.x,
                                onTap: _socialLogin,
                              ),
                              _SocialLoginButton(
                                icon: AppIcons.facebook,
                                onTap: _socialLogin,
                              ),
                              _SocialLoginButton(
                                icon: AppIcons.google,
                                onTap: _socialLogin,
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'لا تملك حساب؟ ',
                                style: AppFonts.bodySmall.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'سجل الآن',
                                  style: AppFonts.bodySmall.copyWith(
                                    color: Color(0xFFBAE9E9),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFBAE9E9),
                                    height: 1.5,
                                    decorationThickness: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Image.asset(
                              AppImages.partners,
                              width: double.infinity,
                              // height: 80,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const _SocialLoginButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 48,
          height: 48,
          padding: EdgeInsets.all(10),
          child: Center(child: SvgPicture.asset(icon, width: 28, height: 28)),
        ),
      ),
    );
  }
}
