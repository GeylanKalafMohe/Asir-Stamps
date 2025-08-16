import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';
import '../partner_loyalty_screen.dart';

class ReferralCapsule extends StatelessWidget {
  const ReferralCapsule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0E3D67).withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white, // Color of the border
          width: 0.5, // Width of the border (stroke)
        ),
      ),
      child: Text(
        'رقمك المرجعي هو: $referralCode',
        style: AppFonts.custom(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
