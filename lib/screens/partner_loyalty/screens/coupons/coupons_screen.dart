import 'package:asir_stamps_app/screens/partner_loyalty/screens/coupons/add_coupons_screen.dart';
import 'package:asir_stamps_app/screens/partner_loyalty/screens/coupons/manage_current_coupon_screen.dart';
import 'package:asir_stamps_app/screens/partner_loyalty/widgets/partner_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../viewmodels/coupon_viewmodel.dart';
import '../../../../widgets/coupons_carousel.dart';
import '../../../../widgets/primary_action_button.dart';

class PartnerCouponsScreen extends StatelessWidget {
  const PartnerCouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          child: Stack(
            children: [
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Consumer<CouponViewModel>(
                    builder: (context, couponViewModel, child) {
                      return Column(
                        children: [
                          // Top Header
                          PartnerHeader(),
                          const SizedBox(height: 24),

                          // Coupons Carousel
                          const CouponsCarousel(),
                          const SizedBox(height: 24),

                          // Action Buttons
                          PrimaryActionButton(
                            text: 'إدارة القسيمة الحالية',
                            icon: Icons.access_time,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ManageCurrentCouponScreen(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          PrimaryActionButton(
                            text: 'إضافة قسائم جديدة',
                            icon: Icons.access_time,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AddCouponsScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
