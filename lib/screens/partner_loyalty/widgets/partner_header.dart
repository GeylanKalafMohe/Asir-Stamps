import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';

class PartnerHeader extends StatelessWidget {
  const PartnerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Greeting on left
        SizedBox(
          width: 180,
          child: Text(
            'أهلاً بك، مطعم شندل',
            style: AppFonts.custom(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: const Color(0xFF475E94),
            ),
          ),
        ),
        Image.asset(AppImages.shandal, width: 150),
      ],
    );
  }
}
