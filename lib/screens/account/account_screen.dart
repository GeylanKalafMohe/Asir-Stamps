import 'package:asir_stamps_app/screens/trip_planner/trip_planner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/account_header.dart';
import 'widgets/discount_coupons_section.dart';
import 'widgets/my_stamps_section.dart';
import 'widgets/support_section.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        toolbarHeight: -20,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AccountHeader(userInfo: userInfo),
              const SizedBox(height: 24),
              const MyStampsSection(),
              const SizedBox(height: 24),
              const DiscountCouponsSection(),
              const SizedBox(height: 24),
              const SupportSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
