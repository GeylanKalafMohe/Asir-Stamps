import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import 'section_widget.dart';

class PlanTripSection extends StatelessWidget {
  const PlanTripSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: 'خطط لرحلتك الآن!',
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        constraints: BoxConstraints(maxWidth: 400),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.textGrey,
            backgroundColor: AppColors.navbarBackground,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'ابدأ التخطيط الآن!',
            style: AppFonts.bodyLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
