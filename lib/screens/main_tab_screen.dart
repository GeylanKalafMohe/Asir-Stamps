import 'package:asir_stamps_app/screens/account/account_screen.dart';
import 'package:asir_stamps_app/screens/digital_passport/digital_passport_screen.dart';
import 'package:asir_stamps_app/screens/discover_aseer/discover_aseer_screen.dart';
import 'package:asir_stamps_app/screens/stations/stations_screen.dart';
import 'package:asir_stamps_app/screens/trip_planner/trip_planner_screen.dart';
import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:asir_stamps_app/utils/app_fonts.dart';
import 'package:asir_stamps_app/viewmodels/navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  final List<Widget> _screens = const [
    DigitalPassportScreen(),
    TripPlannerScreen(),
    DiscoverAseerScreen(),
    StationsScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationViewModel>(
      builder: (context, navigationViewModel, child) {
        return Scaffold(
          body: _screens[navigationViewModel.currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () => navigationViewModel.setCurrentIndex(2),
            backgroundColor: AppColors.primary,
            shape: const CircleBorder(),
            child: const Icon(Icons.search, color: Colors.white),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: navigationViewModel.currentIndex,
            onTap: (index) => navigationViewModel.setCurrentIndex(index),
            backgroundColor: AppColors.scaffoldBackground,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: AppFonts.caption,
            selectedLabelStyle: AppFonts.caption,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'الجواز الرقمي',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'تخطيط الرحلة'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white),
                label: 'اكتشف عسير',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: 'المحطات',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الحساب'),
            ],
          ),
        );
      },
    );
  }
}
