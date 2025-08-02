import 'package:asir_stamps_app/models/passport_data.dart';
import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:asir_stamps_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class StampsCollectionCard extends StatelessWidget {
  final PassportData passportData;

  const StampsCollectionCard({super.key, required this.passportData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildStampCard(
              'ذهبي',
              AppColors.stampGoldGradient,
              AppColors.stampGold,
              passportData.goldStamps,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStampCard(
              'فضي',
              AppColors.stampSilverGradient,
              AppColors.stampSilver,
              passportData.silverStamps,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStampCard(
              'برونزي',
              AppColors.stampBronzeGradient,
              AppColors.stampBronze,
              passportData.bronzeStamps,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStampCard(
    String title,
    LinearGradient gradient,
    Color strokeColor,
    int count,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: gradient,
              shape: BoxShape.circle,
              border: Border.all(color: strokeColor, width: 4),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppFonts.bodySmall.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: strokeColor.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '$count',
              style: AppFonts.bodySmall.copyWith(
                color: AppColors.textGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
