import 'package:asir_stamps_app/models/coupon_data.dart';
import 'package:asir_stamps_app/utils/datetime_extensions.dart';
import 'package:asir_stamps_app/viewmodels/coupon_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../widgets/primary_action_button.dart';
import 'widgets/coupon_entry_card.dart';

class AddCouponsScreen extends StatefulWidget {
  const AddCouponsScreen({super.key});

  @override
  State<AddCouponsScreen> createState() => _AddCouponsScreenState();
}

class _AddCouponsScreenState extends State<AddCouponsScreen> {
  List<Map<String, dynamic>> couponFormData = [{}];

  void _addMoreCoupons() {
    setState(() {
      couponFormData.add({});
    });
  }

  void _removeCoupon(int index) {
    if (couponFormData.length > 1) {
      setState(() {
        couponFormData.removeAt(index);
      });
    }
  }

  void _updateCouponData(int index, Map<String, dynamic> data) {
    if (index < couponFormData.length) {
      couponFormData[index] = data;
    }
  }

  void _submitCoupons() async {
    // Validate and convert form data to CouponData objects
    final validCoupons = <CouponData>[];

    for (final formData in couponFormData) {
      if (formData.isNotEmpty &&
          formData['discount'] != null &&
          formData['discount'] > 0 &&
          formData['quantity'] != null &&
          formData['quantity'] > 0 &&
          formData['valid_days'] != null &&
          formData['valid_days'] > 0) {
        final couponData = CouponData(
          discount: '${formData['discount']}%',
          remainingCoupons: formData['quantity'] as int,
          referralCode: 'CP-${DateTime.now().millisecondsSinceEpoch}',
          restaurantName: 'مطعم شندل',
          isActive: true,
          endDate: DateTimeExtensions.today.add(
            Duration(days: formData['valid_days'] as int),
          ),
        );
        validCoupons.add(couponData);
      }
    }

    if (validCoupons.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال بيانات صحيحة للقسائم')),
      );
      return;
    }

    // TODO: Submit to backend (Firestore/REST API)
    print('Submitting coupons: ${validCoupons.map((c) => c.toMap()).toList()}');

    final couponViewModel = Provider.of<CouponViewModel>(
      context,
      listen: false,
    );
    await couponViewModel.addCoupons(validCoupons);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إضافة ${validCoupons.length} قسيمة بنجاح')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'إضافة قسائم',
            style: AppFonts.heading3.copyWith(
              color: AppColors.primary,
              fontWeight: AppFonts.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Dynamic coupon entry cards
                      ...List.generate(
                        couponFormData.length,
                        (index) => CouponEntryCard(
                          index: index,
                          onDataChanged: _updateCouponData,
                          onRemove: couponFormData.length > 1
                              ? () => _removeCoupon(index)
                              : null,
                        ),
                      ),

                      // Add more button
                      TextButton.icon(
                        onPressed: _addMoreCoupons,
                        icon: const Icon(Icons.add, color: AppColors.primary),
                        label: Text(
                          'إضافة المزيد',
                          style: AppFonts.bodyMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: AppFonts.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Submit button
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: PrimaryActionButton(
                  text: 'إضافة القسائم',
                  icon: Icons.check,
                  onPressed: _submitCoupons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
