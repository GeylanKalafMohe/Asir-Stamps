import 'package:asir_stamps_app/screens/partner_loyalty/screens/scan/screens/history_screen.dart';
import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../partner_loyalty_screen.dart';
import '../../widgets/history_button.dart';
import '../../widgets/partner_header.dart';
import '../../widgets/scan_card.dart';
import '../../widgets/stats_card.dart';
import '../../widgets/top_carousel.dart';

class PartnerScanScreen extends StatelessWidget {
  const PartnerScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: Stack(
          children: [
            // Grey circle background
            PositionedDirectional(
              top: 80,
              start: -300,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF141409).withValues(alpha: 0.2),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Top header with greeting and logo
                      const PartnerHeader(),

                      // Carousel with overlay
                      const TopCarousel(),
                      const SizedBox(height: 10),

                      // Scan card
                      const ScanCard(),

                      const SizedBox(height: 8),

                      // History button
                      HistoryButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HistoryScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 8),

                      // Statistics cards
                      Column(
                        children: [
                          StatsCard(
                            number: usedCouponsLast24h.toString(),
                            text: 'عدد القسائم المستخدمة لآخر 24 ساعة',
                            numberTrailing: 'قسائم',
                            icon: AppIcons.lightning,
                          ),
                          const SizedBox(height: 16),
                          StatsCard(
                            number: '${totalDiscountThisMonth.toInt()}',
                            text: 'إجمالي الخصومات المقدمة لهذا الشهر',
                            icon: AppIcons.gaugeRising,
                            numberTrailingIcon: AppIcons.riyal,
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),
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
}
