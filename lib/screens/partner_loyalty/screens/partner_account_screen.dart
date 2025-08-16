import 'package:asir_stamps_app/screens/account/widgets/support_section.dart';
import 'package:asir_stamps_app/screens/onboarding/onboarding_screen.dart';
import 'package:asir_stamps_app/screens/sign_up/widgets/custom_dropdown.dart';
import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:asir_stamps_app/viewmodels/navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_fonts.dart';

class PartnerAccountScreen extends StatefulWidget {
  const PartnerAccountScreen({super.key});

  @override
  State<PartnerAccountScreen> createState() => _PartnerAccountScreenState();
}

class _PartnerAccountScreenState extends State<PartnerAccountScreen> {
  String? selectedBranch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الحساب',
                        style: AppFonts.heading2.copyWith(
                          color: AppColors.accountBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Navigate to Stations screen (index 3)
                              final navigationViewModel =
                                  Provider.of<NavigationViewModel>(
                                    context,
                                    listen: false,
                                  );
                              navigationViewModel.setCurrentIndex(
                                0,
                              ); // Navigate to StationsScreen (index 3 in MainTabScreen)

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const OnboardingScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: AppColors.accountBlue,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              color: AppColors.accountBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: Image.asset(AppImages.shandal, width: 100),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'مطعم شندل',
                              style: AppFonts.bodyLarge.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'ShandalResturant@gmail.com',
                              style: AppFonts.bodySmall.copyWith(
                                color: AppColors.accountGray,
                              ),
                            ),
                            SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accountBlue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                              ),
                              child: Text(
                                'تعديل الحساب',
                                style: AppFonts.caption.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'بــاقـاتــي',
                    style: AppFonts.bodyLarge.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      SvgPicture.asset(AppImages.mySubscription),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 16),
                        child: Image.asset(AppIcons.checkmarkBig, width: 120),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // --------
            const SizedBox(height: 8),
            // ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إدارة الفروع',
                    style: AppFonts.bodyLarge.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomDropdown<String>(
                    label: '',
                    value: selectedBranch,
                    hintText: 'اختر الفرع',
                    items: const [
                      DropdownMenuItem(
                        value: 'branch1',
                        child: Text('الفرع الرئيسي - أبها'),
                      ),
                      DropdownMenuItem(
                        value: 'branch2',
                        child: Text('فرع خميس مشيط'),
                      ),
                      DropdownMenuItem(
                        value: 'branch3',
                        child: Text('فرع النماص'),
                      ),
                      DropdownMenuItem(
                        value: 'branch4',
                        child: Text('فرع تنومة'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedBranch = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --------
            const SupportSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
