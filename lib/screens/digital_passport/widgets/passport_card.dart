import 'package:asir_stamps_app/screens/trip_planner/trip_planner_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../models/passport_data.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class PassportCard extends StatelessWidget {
  final PassportData passportData;

  const PassportCard({super.key, required this.passportData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primarySecondaryBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primarySecondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'رقمك المرجعي هو: ${passportData.referenceNumber}',
              style: AppFonts.bodySmall.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Image.asset(userInfo.profileImage),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white70,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        passportData.location,
                        style: AppFonts.bodyTiny.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مرحبا بعودتك',
                      style: AppFonts.bodyTiny.copyWith(color: Colors.white70),
                    ),
                    Text(
                      passportData.userName,
                      style: AppFonts.heading2.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: QrImageView(
                  data: passportData.referenceNumber,
                  version: QrVersions.auto,
                  size: 80,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
