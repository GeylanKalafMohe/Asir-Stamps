import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/banner_data.dart';
import '../../models/passport_data.dart';
import 'widgets/banner_card.dart';
import 'widgets/leaderboard.dart';
import 'widgets/level_progress_card.dart';
import 'widgets/passport_card.dart';
import 'widgets/stamps_collection_card.dart';

class DigitalPassportScreen extends StatelessWidget {
  const DigitalPassportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerData = BannerData(
      image: AppImages.stageDance,
      title: 'العرضة العسيرية',
      description: 'لا تفوت فرصة اكتشاف عسير',
      subtitle: 'وجوه تتطلع لمستقبل مشرق',
    );

    final passportData = PassportData(
      referenceNumber: 'CP-SA-00001',
      userName: 'بكر شاهر',
      location: 'عسير، أبها',
      profileImage: 'assets/profile.jpg',
      currentLevel: 2,
      stampsToNextLevel: 3,
      goldStamps: 5,
      silverStamps: 8,
      bronzeStamps: 12,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        toolbarHeight: -10,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              BannerCard(bannerData: bannerData),
              PassportCard(passportData: passportData),
              LevelProgressCard(passportData: passportData),
              StampsCollectionCard(passportData: passportData),
              const SizedBox(height: 24),
              const Leaderboard(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
