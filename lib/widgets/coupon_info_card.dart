import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../models/coupon_data.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../widgets/rounded_info_row.dart';

class CouponInfoCard extends StatelessWidget {
  final CouponData couponData;

  const CouponInfoCard({
    super.key,
    required this.couponData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Left side - Info rows
          Expanded(
            child: Column(
              children: [
                RoundedInfoRow(
                  label: 'الخصم',
                  value: couponData.discount,
                  icon: Icons.check_circle,
                ),
                RoundedInfoRow(
                  label: 'القسائم المتبقية',
                  value: '${couponData.remainingCoupons} قسيمة متبقية',
                  icon: Icons.check_circle,
                ),
                RoundedInfoRow(
                  label: 'الحالة',
                  value: couponData.status,
                  icon: Icons.check_circle,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          // Right side - QR Code
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: QrImageView(
                      data: couponData.referralCode,
                      version: QrVersions.auto,
                      size: 100,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      'https://images.deliveryhero.io/image/hungerstation/restaurant/logo/e6d22393b210c938d7d508eec4d299f1.jpg',
                      width: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'القسيمة الحالية',
                style: AppFonts.bodySmall.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}