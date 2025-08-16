import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class FormTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final String onSubtitleActionText;
  final VoidCallback? onSubtitleAction;
  final LinearGradient? titleGradient;

  const FormTitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onSubtitleActionText,
    this.onSubtitleAction,
    this.titleGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleGradient != null
            ? ShaderMask(
                shaderCallback: (bounds) => titleGradient!.createShader(bounds),
                child: Text(
                  title,
                  style: AppFonts.heading1.copyWith(
                    color: Colors.white,
                    fontWeight: AppFonts.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : Text(
                title,
                style: AppFonts.heading1.copyWith(
                  color: AppColors.primary,
                  fontWeight: AppFonts.bold,
                ),
                textAlign: TextAlign.center,
              ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subtitle,
              style: AppFonts.caption.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 3),
            GestureDetector(
              onTap: onSubtitleAction,
              child: Text(
                onSubtitleActionText,
                style: AppFonts.caption.copyWith(
                  color: AppColors.navbarBackground,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
