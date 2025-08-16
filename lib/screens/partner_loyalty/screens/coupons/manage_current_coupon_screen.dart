import 'package:asir_stamps_app/utils/datetime_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../viewmodels/coupon_viewmodel.dart';
import '../../../../widgets/coupons_count_section.dart';
import '../../../../widgets/discount_section.dart';
import '../../../../widgets/duration_section.dart';

class ManageCurrentCouponScreen extends StatefulWidget {
  const ManageCurrentCouponScreen({super.key});

  @override
  State<ManageCurrentCouponScreen> createState() =>
      _ManageCurrentCouponScreenState();
}

class _ManageCurrentCouponScreenState extends State<ManageCurrentCouponScreen> {
  late bool _isEnabled;
  late int _discountValue;
  late int _couponsCount;
  DateTime _startDate = DateTimeExtensions.today;
  DateTime _endDate = DateTimeExtensions.today.add(const Duration(days: 12));

  @override
  void initState() {
    super.initState();
    final couponViewModel = Provider.of<CouponViewModel>(
      context,
      listen: false,
    );
    final currentCoupon = couponViewModel.couponData;

    _isEnabled = currentCoupon.isActive;
    _discountValue =
        int.tryParse(currentCoupon.discount.replaceAll('%', '')) ?? 20;
    _couponsCount = currentCoupon.remainingCoupons;
    _startDate = currentCoupon.startDate;
    _endDate = currentCoupon.endDate;
  }

  int get _durationDays => _endDate.difference(_startDate).inDays;

  void _saveChanges() {
    final couponViewModel = Provider.of<CouponViewModel>(
      context,
      listen: false,
    );

    // Update current coupon in ViewModel
    couponViewModel.updateCurrentCoupon(
      discount: '$_discountValue%',
      remainingCoupons: _couponsCount,
      isActive: _isEnabled,
      status: _isEnabled ? 'فعال' : 'غير فعال',
      startDate: _startDate,
      endDate: _endDate,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ التعديلات بنجاح'),
        backgroundColor: AppColors.primary,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'إدارة القسائم الحالية',
          style: AppFonts.heading2.copyWith(
            color: AppColors.primary,
            fontWeight: AppFonts.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Activation Toggle
              Row(
                children: [
                  Text(
                    'تفعيل',
                    style: AppFonts.bodyLarge.copyWith(
                      color: AppColors.primary,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Switch(
                    value: _isEnabled,
                    onChanged: (value) => setState(() => _isEnabled = value),
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Discount Section
              DiscountSection(
                discountValue: _discountValue,
                onDiscountChanged: (value) =>
                    setState(() => _discountValue = value),
              ),

              const SizedBox(height: 8),
              Divider(thickness: 0.5),

              // Duration Section
              DurationSection(
                durationDays: _durationDays,
                startDate: _startDate,
                endDate: _endDate,
                onStartDateChanged: (date) => setState(() => _startDate = date),
                onEndDateChanged: (date) => setState(() => _endDate = date),
              ),
              const SizedBox(height: 8),
              Divider(thickness: 0.5),

              // Coupons Count Section
              CouponsCountSection(
                couponsCount: _couponsCount,
                onCountChanged: (count) =>
                    setState(() => _couponsCount = count),
              ),
              const SizedBox(height: 40),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'حفظ التعديلات',
                    style: AppFonts.bodyLarge.copyWith(
                      color: Colors.white,
                      fontWeight: AppFonts.bold,
                    ),
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
