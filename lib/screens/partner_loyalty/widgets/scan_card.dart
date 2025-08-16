import 'package:asir_stamps_app/screens/partner_loyalty/screens/scan/screens/qr_scanner_screen.dart';
import 'package:asir_stamps_app/screens/partner_loyalty/widgets/referral_capsule.dart';
import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_fonts.dart';

class ScanCard extends StatelessWidget {
  const ScanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QRScannerScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF122F5B),
          padding: const EdgeInsets.symmetric(vertical: 32),
          foregroundColor: const Color(0xFF0F2B56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
        ),
        child: Column(
          children: [
            // Referral capsule
            const ReferralCapsule(),

            const SizedBox(height: 16),

            Container(
              width: 230,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text('مسح الرمز', style: AppFonts.heading3),
                  Spacer(),
                  SvgPicture.asset(AppIcons.scan),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
