import 'package:flutter/material.dart';

import '../../../models/onboarding_page.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/app_images.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;
  final bool isLastPage;

  const OnboardingPageWidget({
    super.key,
    required this.page,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(page.backgroundImage, fit: BoxFit.cover),
        ),
        // Dark gradient overlay
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black54, Colors.black87],
                stops: [0.0, 0.6, 1.0],
              ),
            ),
          ),
        ),
        // Content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Logo (hidden on last page)
                if (!isLastPage) ...[
                  Center(
                    child: Image.asset(
                      AppIcons.hackathonLogo2,
                      width: MediaQuery.sizeOf(context).width / 1.3,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                ],
                // Text content
                Text(
                  page.headline,
                  style: AppFonts.custom(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  page.subheadline,
                  style: AppFonts.bodyMedium.copyWith(
                    color: Colors.white,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                SizedBox(height: 210),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
