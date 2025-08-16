import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import 'screens/coupons/coupons_screen.dart';
import 'screens/partner_account_screen.dart';
import 'screens/scan/scan_screen.dart';
import 'screens/statistics_screen.dart';

// Mock data - replace with backend calls
final String referralCode = "IP-SA-00001";
final int usedCouponsLast24h = 5;
final double totalDiscountThisMonth = 750.0;

class PartnerLoyaltyScreen extends StatefulWidget {
  const PartnerLoyaltyScreen({super.key});

  @override
  State<PartnerLoyaltyScreen> createState() => _PartnerLoyaltyScreenState();
}

class _PartnerLoyaltyScreenState extends State<PartnerLoyaltyScreen> {
  int _currentIndex = 3; // Start with scan tab active
  final List<Widget> _screens = const [
    PartnerAccountScreen(),
    PartnerStatisticsScreen(),
    PartnerCouponsScreen(),
    PartnerScanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: AppColors.scaffoldBackground,
          selectedItemColor: const Color(0xFF0F2B56),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: AppFonts.caption,
          unselectedLabelStyle: AppFonts.caption,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الحساب'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'الإحصائيات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number),
              label: 'إدارة القسائم',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'مسح الرمز',
            ),
          ],
        ),
      ),
    );
  }
}

// Backend integration functions - TODO: implement
Future<void> redeemScannedCode(String code) async {
  // TODO: call Firestore / REST API here
  // Example Firestore call:
  // await FirebaseFirestore.instance.collection('redemptions').add({
  //   'code': code,
  //   'partnerId': 'IP-SA-00001',
  //   'timestamp': FieldValue.serverTimestamp(),
  // });
}

Future<void> fetchDashboardStats() async {
  // TODO: fetch referralCode, stats from backend
  // Example Firestore call:
  // final doc = await FirebaseFirestore.instance
  //     .collection('partners')
  //     .doc('IP-SA-00001')
  //     .get();
  // return doc.data();
}
