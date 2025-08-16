import 'package:asir_stamps_app/models/onboarding_page.dart';
import 'package:asir_stamps_app/screens/login_screen.dart';
import 'package:asir_stamps_app/screens/onboarding/widgets/onboarding_page_widget.dart';
import 'package:asir_stamps_app/screens/onboarding/widgets/page_indicator.dart';
import 'package:asir_stamps_app/screens/partner_registration/partner_registration_screen.dart';
import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:asir_stamps_app/utils/app_fonts.dart';
import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    const OnboardingPage(
      backgroundImage: AppImages.onboarding1,
      headline: 'اكتشف خبايا عسير',
      subheadline: 'رحلة تبدأ بخطوة وتخلد بختم',
      primaryButtonText: 'التالي',
      secondaryButtonText: 'تخطي',
    ),
    const OnboardingPage(
      backgroundImage: AppImages.onboarding2,
      headline: 'حوّل رحلتك إلى مغامرة',
      subheadline:
          'اجمع الأختام الرقمية من كل موقع، تنافس على الصدارة، وارتق من مستكشف إلى خبير',
      primaryButtonText: 'التالي',
      secondaryButtonText: 'تخطي',
    ),
    const OnboardingPage(
      backgroundImage: AppImages.onboarding3,
      headline: 'مكافآت حقيقية تنتظرك',
      subheadline:
          'حوّل أختامك إلى خصومات في أفضل المطاعم والمقاهي والكثير بانتظارك',
      primaryButtonText: 'التالي',
      secondaryButtonText: 'تخطي',
    ),
    const OnboardingPage(
      backgroundImage: AppImages.onboarding4,
      headline: 'خطط رحلتك، واصنع التاريخ!',
      subheadline:
          'انضم إلى آلاف المستكشفين الذين يوثقون قصصهم ويعيدون اكتشاف كنوز عسير',
      primaryButtonText: 'ابدأ جمع الأختام الآن!',
      secondaryButtonText: 'طلب تسجيل فريق جديد',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _completeOnboarding() async {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void _pushPartnerScreen() async {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PartnerRegistrationScreen(),
        ),
      );
    }
  }

  bool get _isLastPage => _currentPage == _pages.length - 1;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // PageView for background images and content
            PageView.builder(
              controller: _pageController,
              physics: const ClampingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return OnboardingPageWidget(
                  page: _pages[index],
                  isLastPage: index == _pages.length - 1,
                );
              },
            ),
            // Static buttons and indicators
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Page indicator (above primary button except on last page)
                      if (!_isLastPage) ...[
                        PageIndicator(
                          currentPage: _currentPage,
                          totalPages: _pages.length,
                        ),
                        const SizedBox(height: 16),
                      ],
                      // Primary button (always capsule)
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.navbarBackground,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            _pages[_currentPage].primaryButtonText,
                            style: AppFonts.bodyLarge.copyWith(
                              color: Colors.white,
                              fontWeight: AppFonts.medium,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Secondary button
                      if (_isLastPage)
                        // Last page: capsule button with grey background
                        ElevatedButton(
                          onPressed: _pushPartnerScreen,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF444852),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 24),
                          ),
                          child: Text(
                            _pages[_currentPage].secondaryButtonText,
                            style: AppFonts.bodyMedium.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        )
                      else
                        // Other pages: underlined text button
                        TextButton(
                          onPressed: _skipOnboarding,
                          child: Text(
                            _pages[_currentPage].secondaryButtonText,
                            style: AppFonts.bodySmall.copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 0.5,
                              height: 1.5,
                            ),
                          ),
                        ),
                      // Page indicator (below secondary button on last page)
                      if (_isLastPage) ...[
                        const SizedBox(height: 12),
                        PageIndicator(
                          currentPage: _currentPage,
                          totalPages: _pages.length,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
